//
//  ImageDetailViewModel.swift
//  FlickerImage
//
//  Created by Edilberto Ramos on 01/06/24.
//

import SwiftUI

class ImageDetailViewModel: ObservableObject {
    
    @Published var title: String

    init(title: String) {
        self.title = title
    }
    
}
