//
//  CollectionExtensionsTests.swift
//  SwiftUtilsTests
//
//  Created by Hiroaki Tomiyoshi on 2018/09/17.
//  Copyright © 2018年 Hiroaki Tomiyoshi. All rights reserved.
//

import XCTest
@testable import SwiftUtils

class CollectionExtensionsTests: XCTestCase {
    
    func testAppropriateAll() {
        func isOdd(i: Int) -> Bool {
            return i % 2 == 1
        }
        XCTAssertTrue([1, 3, 5].appropriateAll(predicate: isOdd))
        XCTAssertFalse([1, 3, 4].appropriateAll(predicate: isOdd))
        XCTAssertTrue(([] as [Int]).appropriateAll(predicate: isOdd))
    }

}
