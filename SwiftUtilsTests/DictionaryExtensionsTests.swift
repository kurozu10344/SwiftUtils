//
//  DictionaryExtensionsTests.swift
//  SwiftUtilsTests
//
//  Created by Hiroaki Tomiyoshi on 2018/09/29.
//  Copyright © 2018 Hiroaki Tomiyoshi. All rights reserved.
//

import XCTest
@testable import SwiftUtils

class DictionaryExtensionsTests: XCTestCase {

    func testPlus() {
        var dict: [String:Int]!
        
        dict = ["1": 1, "2": 2] + ["3": 3, "4": 4]
        XCTAssertEqual(dict.count, 4)
        XCTAssertEqual(dict["1"], 1)
        XCTAssertEqual(dict["2"], 2)
        XCTAssertEqual(dict["3"], 3)
        XCTAssertEqual(dict["4"], 4)
        
        dict = ["1": 1, "2": 2] + ["2": 3, "3": 4]
        XCTAssertEqual(dict.count, 3)
        XCTAssertEqual(dict["1"], 1)
        XCTAssertEqual(dict["2"], 3)
        XCTAssertEqual(dict["3"], 4)
    }
    
    func testPlutEquals() {
        var dict: [String:Int]!
        
        dict = ["1": 1, "2": 2]
        dict += ["3": 3, "4": 4]
        XCTAssertEqual(dict.count, 4)
        XCTAssertEqual(dict["1"], 1)
        XCTAssertEqual(dict["2"], 2)
        XCTAssertEqual(dict["3"], 3)
        XCTAssertEqual(dict["4"], 4)
        
        dict = ["1": 1, "2": 2]
        dict += ["2": 3, "3": 4]
        XCTAssertEqual(dict.count, 3)
        XCTAssertEqual(dict["1"], 1)
        XCTAssertEqual(dict["2"], 3)
        XCTAssertEqual(dict["3"], 4)
    }
}
