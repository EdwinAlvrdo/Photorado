//
//  NetworkingTest.swift
//  PhotoradoTests
//
//  Created by Edwin Alvarado on 4/17/21.
//

import XCTest
import Moya
@testable import Photorado

//Just a little test for service
class NetworkingTest: XCTestCase {
    
    private var testBundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func test_that_test_bundle_has_mock_asset() {
        let jsonPath = testBundle.url(
            forResource: "mock_feeds_colorado_mountains",
            withExtension: "json",
            subdirectory: "./",
            localization: testBundle.resourcePath)
        
        XCTAssertNotNil(jsonPath)
    }
    
    func test_feed_proccess_result() {
        let exp = expectation(description: "response")
        
        FeedsService.attemptGetPublicPhotos(from: "coloradomountains") { (result) in
            XCTAssertNotNil(result)
            XCTAssertNotNil(result?.items)
            XCTAssertEqual(result?.items?.count, 20)
            exp.fulfill()
        }
        waitForExpectations(timeout: 10) { (error) in
            //Validate with nil assert or something
        }
    }
    
    func test_feed_per_author_id() { //"39908901@N06"
        let feedVM = FeedsViewModel()
        feedVM.model = testBundle.decodeJSONFeeds(from: "mock_feeds_colorado_mountains")
        
        let filteredModel = feedVM.filterModelBy(author: "39908901@N06")
        XCTAssertEqual(filteredModel.count, 12)
    }
        
}

