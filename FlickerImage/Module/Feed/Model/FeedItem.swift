//
//  FeedItem.swift
//  FlickerImage
//
//  Created by Edilberto Ramos on 01/06/24.
//

import Foundation

struct FeedItem: Codable {
    
    let title: String
    let link: String
    let media: FeedItemMedia
    let dateTaken: String
    let description: String
    let published: String
    let author: String
    let authorID: String
    let tags: String
    
    enum CodingKeys: String, CodingKey {
        case title, link, media, description, published, author, tags
        case dateTaken = "date_taken"
        case authorID = "author_id"
    }
    
}
