//
//  PhotoradoTests.swift
//  PhotoradoTests
//
//  Created by Edwin Alvarado on 4/17/21.
//

import XCTest
@testable import Photorado

class PhotoradoTests: XCTestCase {

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

//MARK: - Test Splash Controller
extension PhotoradoTests {
    func test_splash_text() {
        let vc = SplashVC()
//        For test case - Maybe if this texts come from a cnd or something like this
//        XCTAssertEqual(vc.titleLabel.text, "WhateverUWant")
        XCTAssertEqual(vc.titleLabel.text, "Finding mountains...")
    }
    
}


