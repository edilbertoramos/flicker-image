//
//  FeedTests.swift
//  FlickerImageTests
//
//  Created by Edilberto Ramos on 01/06/24.
//

import XCTest
@testable import FlickerImage

final class FeedTests: XCTestCase {

    func testFeedService_searchPorcupineResultItems_shouldReturnIsEmptyFalse() async throws {
        let service: FeedServiceProtocol = FeedService()
        let tags = "porcupine"
        let result = try await service.feed(tags: tags)
        switch result.result {
        case .success(let result):
            XCTAssert(result.items.isEmpty == false)
        case .failure(let error):
            XCTAssertThrowsError(error)
        }
    }

}
