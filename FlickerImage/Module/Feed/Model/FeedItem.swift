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

// MARK: - Mock
extension FeedItem {
    
    static var mock: FeedItem {
        return FeedItem(
            title: "CAMPANHA DIA MUNDIAL DA ASMA",
            link: "https://www.flickr.com/photos/194631036@N04/53699210182/",
            media: FeedItemMedia(
                m: "https://live.staticflickr.com/65535/53699210182_2cfe9267b9_m.jpg"
            ),
            dateTaken: "2024-05-03T09:46:06-08:00",
            description: """
            <p><a href=\"https://www.flickr.com/people/194631036@N04/\">FIESP/SESI/SENAI/CIESP/CCF</a> posted a photo:</p>
            <p><a href=\"https://www.flickr.com/photos/194631036@N04/53699210182/\" title=\"CAMPANHA DIA MUNDIAL DA ASMA\">
            <img src=\"https://live.staticflickr.com/65535/53699210182_2cfe9267b9_m.jpg\" width=\"240\" height=\"160\" alt=\"CAMPANHA DIA MUNDIAL DA ASMA\" />
            </a></p>
            <p>São Paulo, 06 de Maio de 2024 - Campanha do dia Mundial da Asma, que acontece na calçada da Fiesp, na avenida Paulista.</p>
            """,
            published: "2024-05-05T15:14:22Z",
            author: "nobody@flickr.com (\"FIESP/SESI/SENAI/CIESP/CCF\")",
            authorID: "194631036@N04",
            tags: "campanha dia mundial asma calçada paulista teste medico população"
        )
    }
    
}
