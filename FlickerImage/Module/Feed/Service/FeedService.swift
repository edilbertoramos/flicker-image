//
//  FeedService.swift
//  FlickerImage
//
//  Created by Edilberto Ramos on 01/06/24.
//

import Foundation

final class FeedService: FeedServiceProtocol {
    
    private enum EndPoint: String, ServiceEndpoint {
        case feed = "services/feeds/photos_public.gne"
    }
    
    func feed(tags: String) async throws -> ServiceResult<FeedResult> {
        let url = try ServiceHelper.makeUrl(withEndPoint: EndPoint.feed)
        
        var parameters = [String: Any]()
        parameters["format"] = "json"
        parameters["nojsoncallback"] = 1
        parameters["tags"] = tags
        
        return try await ServiceHelper.get(url: url, parameters: parameters)
    }
    
}
