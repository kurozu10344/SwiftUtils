//
//  OperatorsTests.swift
//  SwiftUtilsTests
//
//  Created by Hiroaki Tomiyoshi on 2018/09/09.
//  Copyright © 2018年 Hiroaki Tomiyoshi. All rights reserved.
//

import XCTest
import SwiftUtils

class OperatorsTests: XCTestCase {
    func testEqualsQuestionNotOptional() {
        var lhs: Int = 0
        
        lhs =? (1 as Int?); XCTAssertEqual(lhs, 1)
        lhs =? (nil as Int?); XCTAssertEqual(lhs, 1)
        lhs =? (2 as Int?); XCTAssertEqual(lhs, 2)
    }
    
    func testEqualsQuestionOptional() {
        var lhs: Int? = nil
        
        lhs =? (nil as Int?); XCTAssertEqual(lhs, nil)
        lhs =? (1 as Int?); XCTAssertEqual(lhs, 1)
        lhs =? (nil as Int?); XCTAssertEqual(lhs, 1)
        lhs =? (2 as Int?); XCTAssertEqual(lhs, 2)
    }
}
