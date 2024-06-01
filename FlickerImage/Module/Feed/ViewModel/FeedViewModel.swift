//
//  FeedViewModel.swift
//  FlickerImage
//
//  Created by Edilberto Ramos on 01/06/24.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    
    @Published var items: Array<FeedItem> = []
    @Published var selectedItem: FeedItem?
    @Published var seachText: String = "" {
        didSet {
            handleSearch()
        }
    }
    
    private let service: FeedServiceProtocol

    init(service: FeedServiceProtocol = FeedService()) {
        self.service = service
        handleSearch()
    }
    
    func handleSearch() {
        Task {
            await getItems()
        }
    }
    
    func getItems() async {
        do {
            let response = try await service.feed(tags: seachText)
            switch response.result {
            case .success(let result):
                DispatchQueue.main.async {
                    self.items = result.items
                }
            case .failure(let error):
                debugPrint(error)
            }
        } catch {
            debugPrint(error)
        }
    }
    
}
