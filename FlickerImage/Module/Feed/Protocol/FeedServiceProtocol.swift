//
//  FeedServiceProtocol.swift
//  FlickerImage
//
//  Created by Edilberto Ramos on 01/06/24.
//

import Foundation

protocol FeedServiceProtocol {
    
    func feed(tags: String) async throws -> ServiceResult<FeedResult>
    func image(url: String, localUrl: String) async throws -> ServiceResult<URL>

}
