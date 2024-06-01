//
//  ImageDetailView.swift
//  FlickerImage
//
//  Created by Edilberto Ramos on 01/06/24.
//

import SwiftUI

struct ImageDetailView: View, FeedResourceProtocol {
   
    @ObservedObject var viewModel: ImageDetailViewModel

    var body: some View {
        VStack {
            Text(
                description(
                    label: Label.title,
                    value: viewModel.title
                )
            )
            Text(
                description(
                    label: Label.description,
                    value: viewModel.title
                )
            )
            Text(
                description(
                    label: Label.author,
                    value: viewModel.title
                )
            )
            Text(
                description(
                    label: Label.publishedDate,
                    value: viewModel.title
                )
            )
        }
    }
    
    func description(label: String, value: String) -> String {
        String(
            format: Format.labelAndValue,
            arguments: [label, value]
        )
    }
    
}

#Preview {
    ImageDetailView(viewModel: ImageDetailViewModel(title: "1"))
}
