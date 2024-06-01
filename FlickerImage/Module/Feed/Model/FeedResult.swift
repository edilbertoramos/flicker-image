//
//  FeedResult.swift
//  FlickerImage
//
//  Created by Edilberto Ramos on 01/06/24.
//

import Foundation

struct FeedResult: Codable {
    
    let title: String
    let link: String
    let description: String
    let modified: String
    let generator: String
    let items: [FeedItem]
    
}
