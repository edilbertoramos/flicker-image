//
//  FeedView.swift
//  FlickerImage
//
//  Created by Edilberto Ramos on 01/06/24.
//

import SwiftUI

struct FeedView: View, FeedResourceProtocol {
    
    @StateObject private var viewModel = FeedViewModel()
    @State private var displayDetail: Bool = false
    @State private var columns: [GridItem] = Array(
        repeating: GridItem(
            .flexible(),
            spacing: 2
        ),
        count: 3
    )

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        grid
                    }
                    .padding([.horizontal, .bottom], 2)
                }
            }
            .navigationTitle(Label.flickr)
        }
        .navigationBarTitleDisplayMode(.large)
        .searchable(text: $viewModel.seachText)
        .sheet(isPresented: $displayDetail) {
            if let item = viewModel.selectedItem {
                FeedDetailView(viewModel: FeedDetailViewModel(item: item))
            }
        }
    }
    
    var grid: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: 2) {
            ForEach(viewModel.items, id: \.media.m) { item in
                FeedImageView(item: item)
                    .frame(
                        maxWidth: .infinity,
                        minHeight: 100,
                        maxHeight: 100,
                        alignment: .center
                    )
                    .background(Color.gray.opacity(0.3))
                    .onTapGesture {
                        viewModel.selectedItem = item
                        displayDetail.toggle()
                    }
            }
        }
    }
    
}

#Preview {
    FeedView()
}
