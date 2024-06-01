//
//  FeedDetailViewModel.swift
//  FlickerImage
//
//  Created by Edilberto Ramos on 01/06/24.
//

import SwiftUI

class FeedDetailViewModel: ObservableObject, FeedResourceProtocol {
    
    @Published var item: FeedItem
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Format.dateFormat
        return dateFormatter
    }()
    
    var title: String {
        guard item.title.isEmpty else { return item.title }
        return Label.emptyTitle
    }

    var description: String {
        let extractedText = extractTextBetweenPTags(from: item.description)
        return extractedText.last ?? Label.descriptionNotLoaded
    }
    
    var publishedDate: String {
        let date = dateFormatter.date(from: item.published)
        return date?.formatted(date: .abbreviated, time: .standard) ?? ""
    }
    
    init(item: FeedItem) {
        self.item = item
    }
    
    func extractTextBetweenPTags(from htmlString: String) -> [String] {
        do {
            let pattern = "<p>(.*?)</p>"
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let results = regex.matches(
                in: htmlString,
                options: [],
                range: NSRange(htmlString.startIndex..., in: htmlString)
            )
            return results.map {
                String(htmlString[Range($0.range(at: 1), in: htmlString)!])
            }
        } catch let error {
            print("Invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
}
