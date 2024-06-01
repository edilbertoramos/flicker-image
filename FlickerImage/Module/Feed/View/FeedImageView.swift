//
//  FeedImageView.swift
//  FlickerImage
//
//  Created by Edilberto Ramos on 01/06/24.
//

import SwiftUI

struct FeedImageView: View {
    
    @StateObject private var viewModel: FeedImageViewModel

    init(item: FeedItem) {
        let vm = FeedImageViewModel(url: item.media.m)
        _viewModel = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
    
}

#Preview {
    FeedImageView(item: FeedItem.mock)
}
