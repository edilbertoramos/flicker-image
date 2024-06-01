//
//  FeedView.swift
//  FlickerImage
//
//  Created by Edilberto Ramos on 01/06/24.
//

import SwiftUI

struct FeedView: View, FeedResourceProtocol {
    
    @State private var seachText: String = ""
    @State private var displayDetail: Bool = false
    @State private var columns: [GridItem] = Array(
        repeating: GridItem(
            .flexible(),
            spacing: 2
        ),
        count: 3
    )
    
    @ObservedObject private var viewModel = FeedViewModel()

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
        .searchable(text: $seachText)
        .sheet(isPresented: $displayDetail) {
            ImageDetailView(
                viewModel: ImageDetailViewModel(
                    title: String(viewModel.items[viewModel.selectedItem])
                )
            )
        }
    }
    
    var grid: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: 2) {
            ForEach(viewModel.items.indices, id: \.self) { index in
                if viewModel.items.indices.contains(index) {
                    Image(systemName: "xmark")
                        .frame(
                            maxWidth: .infinity,
                            minHeight: 40,
                            maxHeight: 120,
                            alignment: .center
                        )
                        .padding(32)
                        .background(.gray)
                        .onTapGesture {
                            viewModel.selectedItem = index
                            displayDetail.toggle()
                        }

                }
            }
        }
    }
    
}

#Preview {
    FeedView()
}
