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
    
    var publishedDate: String {
        let date = dateFormatter.date(from: item.published)
        return date?.formatted(date: .abbreviated, time: .standard) ?? ""
    }
    
    init(item: FeedItem) {
        self.item = item
    }
    
}
