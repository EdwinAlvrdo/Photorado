//
//  PhotoradoUtilTest.swift
//  PhotoradoTests
//
//  Created by Edwin Alvarado on 4/17/21.
//

import XCTest
@testable import Photorado

//We dont have to much to test so

class UtilitiesTest: XCTestCase {
    
    var app: UIApplication!
        
    override class func setUp() {
        super.setUp()
        app = UIApplication()
    }
    
    override class func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func testUIApplication() {
        let app = UIApplication()
        XCTAssertNil(app.topCon)
    }

}

