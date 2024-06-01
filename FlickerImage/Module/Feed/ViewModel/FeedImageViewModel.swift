//
//  FeedImageViewModel.swift
//  FlickerImage
//
//  Created by Edilberto Ramos on 01/06/24.
//

import UIKit

class FeedImageViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var image: UIImage? = nil

    private let service: FeedServiceProtocol
    private let url: String
    private var imageKey: String {
        url.components(separatedBy: "/").last ?? ""
    }
    
    init(url: String, service: FeedServiceProtocol = FeedService()) {
        self.url = url
        self.service = service
        getImage()
    }
    
    func getImage() {
        isLoading = true
        Task {
            do {
                let localUrl = try BucketHelper.shared.makeUrl(toImage: imageKey)
                let result = try await FeedService().image(url: url, localUrl: localUrl)
                DispatchQueue.main.async { [weak self] in
                    switch result.result {
                    case .success(let urlResult):
                        do {
                            self?.image = try BucketHelper.shared.loadImage(for: urlResult)
                        } catch {
                            self?.image = UIImage(systemName: "xmark")
                        }
                    case .failure(_):
                        self?.image = UIImage(systemName: "xmark")
                    }
                    self?.isLoading = false
                }
            } catch {
                print(error)
                isLoading = false
            }
        }
    }
    
}
