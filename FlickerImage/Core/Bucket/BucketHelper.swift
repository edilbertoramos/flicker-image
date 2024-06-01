//
//  BucketHelper.swift
//  FlickerImage
//
//  Created by Edilberto Ramos on 01/06/24.
//

import Foundation
import UIKit

public struct BucketHelper {
    
    private enum BuckekError: Error {
        case folderError
        case imageNotFound(name: String?)
        case imageNotLoadedFromData(name: String?)
    }
    
    public static let shared = BucketHelper()
    
    private let imagesFolderName = "images"
    
    private init() {}

}

// MARK: - Public
public extension BucketHelper {
    
    func makeUrl(toImage name: String) throws -> String {
        return try imagesFolderUrl.appendingPathComponent(name).absoluteString
    }
    
    func loadImage(for url: URL) throws -> UIImage {
        let imageData = try loadImageData(for: url)
        
        guard let image = UIImage(data: imageData) else {
            throw BuckekError.imageNotLoadedFromData(name: url.lastPathComponent)
        }
        
        return image
    }
    
    func loadImageData(for url: URL) throws -> Data {
        guard FileManager.default.fileExists(atPath: url.path) else {
            throw BuckekError.imageNotFound(name: url.lastPathComponent)
        }
        
        let imageData = try Data(contentsOf: url)
        return imageData
    }
    
}

// MARK: - Helper
private extension BucketHelper {

    var imagesFolderUrl: URL {
        get throws {
            let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            guard let folder = urls.first?.appendingPathComponent(imagesFolderName, isDirectory: true) else {
                throw BuckekError.folderError
            }
            do {
                try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
            } catch {
                throw error
            }
            return folder
        }
    }
    
}
