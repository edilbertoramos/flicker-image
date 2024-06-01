//
//  FeedDetailView.swift
//  FlickerImage
//
//  Created by Edilberto Ramos on 01/06/24.
//

import SwiftUI

struct FeedDetailView: View, FeedResourceProtocol {
   
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var viewModel: FeedDetailViewModel

    init(viewModel: FeedDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                FeedImageView(item: viewModel.item)
                    .frame(maxHeight: 400)
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .foregroundColor(.gray)
                }
                .padding(16)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .topTrailing
                )
            }
            VStack(spacing: 24) {
                row(Label.title, value: viewModel.title)
                
                row(Label.description, value: viewModel.description)
                
                row(Label.author, value: viewModel.item.author)
                
                row(Label.publishedDate, value: viewModel.publishedDate)
            }
            .padding(16)
        }
    }
    
    func row(_ label: String, value: String) -> some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.system(.title3))
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
            Text(value)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
}

#Preview {
    FeedDetailView(viewModel: FeedDetailViewModel(item: FeedItem.mock))
}
