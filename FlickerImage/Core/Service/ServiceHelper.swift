//
//  ServiceHelper.swift
//  FlickerImage
//
//  Created by Edilberto Ramos on 01/06/24.
//

import Foundation

public struct ServiceHelper {

    private init() {}
    
    private static let baseUrl = "https://api.flickr.com"

}

// MARK: - Make URL
public extension ServiceHelper {
    
    static func makeUrl(withEndPoint service: ServiceEndpoint) throws -> String {
        return String(
            format: "%@/%@",
            arguments: [baseUrl, service.endpoint]
        )
    }

}

// MARK: - Requests
public extension ServiceHelper {

    static func get<T: Codable>(url: String, parameters: [String: Any]? = nil) async throws -> ServiceResult<T> {
        let url = addParams(parameters, onUrl: url)
        let request = try makeRequest(url: url, method: .get)
        
        return try await withUnsafeThrowingContinuation { continuation in
            let urlSessionTask = URLSession
                .shared
                .dataTask(with: request) { data, response, error in
                    Task {
                        if let error = error {
                            continuation.resume(throwing: error)
                        } else if let data = data,
                                  let response = response as? HTTPURLResponse {
                            switch validate(data: data, response: response) {
                            case .success(let data):
                                continuation.resume(returning: try await decodingData(data))
                            case .failure(let error):
                                continuation.resume(returning: (data, .failure(error)))
                            }
                        }
                    }
                }
            urlSessionTask.resume()
        }
    }

}

// MARK: - Helper
private extension ServiceHelper {
    
    static func makeRequest(url: String, method: ServiceMethod) throws -> URLRequest {
        #if DEBUG
        print("[REQUEST URL] \(url)")
        #endif
        
        guard let url = URL(string: url) else {
            throw ServiceError.invalidUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
    
    static func addParams(_ params: [String: Any]?, onUrl url: String) -> String {
        guard let params = params else {
            return url
        }
        
        let joinedParams = params.map { "\($0)=\($1)" }.joined(separator: "&")
        return String(
            format: "%@?%@",
            arguments: [url, joinedParams]
        )
    }
    
    static func validate<T>(data: T, response: HTTPURLResponse) -> Result<T, ServiceError> {
        switch response.statusCode {
        case 200, 201, 203, 204:
            return .success(data)
        case 400:
            return .failure(.badRequest)
        case 404:
            return .failure(.unauthorized)
        case 500:
            return .failure(.internalServerError)
        default:
            let errorMessage = String(
                format: "[Error] API response error - STATUS CODE [%@]",
                arguments: [response.statusCode]
            )
            return .failure(.custom(errorMessage))
        }
    }

    static func decodingData<T: Codable>(_ data: Data) async throws -> ServiceResult<T> {
        return try await withUnsafeThrowingContinuation { continuation in
            do {
                let decoder = JSONDecoder()
                let decodableData = try decoder.decode(T.self, from: data)
                continuation.resume(returning: (data, .success(decodableData)))
            } catch {
                continuation.resume(returning: (data, .failure(.undecodable)))
            }
        }
    }

}
