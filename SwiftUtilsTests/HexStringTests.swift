//
//  HexStringTests.swift
//  SwiftUtilsTests
//
//  Created by Hiroaki Tomiyoshi on 2018/08/29.
//  Copyright © 2018年 Hiroaki Tomiyoshi. All rights reserved.
//

import XCTest
import SwiftUtils

class HexStringTests: XCTestCase {
    
    func testData_hexString() {
        XCTAssertEqual("0".data(using: .utf8)?.hexString, "30")
        XCTAssertEqual("9".data(using: .utf8)?.hexString, "39")
        XCTAssertEqual("A".data(using: .utf8)?.hexString, "41")
        XCTAssertEqual("Z".data(using: .utf8)?.hexString, "5a")
        XCTAssertEqual("a".data(using: .utf8)?.hexString, "61")
        XCTAssertEqual("z".data(using: .utf8)?.hexString, "7a")
        XCTAssertEqual("ABC".data(using: .utf8)?.hexString, "414243")
        XCTAssertEqual("あ".data(using: .utf8)?.hexString, "e38182")
        XCTAssertEqual("あ".data(using: .shiftJIS)?.hexString, "82a0")
    }
    
}
