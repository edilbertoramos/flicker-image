//
//  FeedViewModel.swift
//  FlickerImage
//
//  Created by Edilberto Ramos on 01/06/24.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    
    @Published var items: [Int] = [
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
        15,
        16,
        17,
        18,
        19,
        20,
        20,
        21,
        22,
        23,
        24,
        25,
        26,
        27,
        28,
        29,
    ]

    @Published var selectedItem: Int = 0

}
