//
//  ArrayExtensionsTests.swift
//  SwiftUtilsTests
//
//  Created by Hiroaki Tomiyoshi on 2018/09/17.
//  Copyright © 2018年 Hiroaki Tomiyoshi. All rights reserved.
//

import XCTest
import SwiftUtils

class ArrayExtensionsTests: XCTestCase {
    
    func testSubscriptSafe() {
        XCTAssertEqual([1, 2, 3][safe: 0], 1)
        XCTAssertEqual([1, 2, 3][safe: 2], 3)
        XCTAssertEqual([1, 2, 3][safe: 3], nil)
        XCTAssertEqual([1, 2, 3][safe: -1], nil)
    }
    
    func testSecond() {
        XCTAssertEqual([1, 2, 3].second, 2)
        XCTAssertEqual([1, 2].second, 2)
        XCTAssertEqual([1].second, nil)
        XCTAssertEqual(([] as [Int]).second, nil)
    }
    
    func testGroupBy() {
        // predicate
        func eq(lhs: Int, rhs: Int) -> Bool {
            return lhs == rhs
        }
        func test(_ lhs: [[Int]], _ rhs: [[Int]]) {
            XCTAssertEqual(lhs.count, rhs.count)
            zip(lhs, rhs).forEach { l, r in
                XCTAssertEqual(l, r)
            }
        }
        
        test([1,1,1].groupBy(eq), [[1,1,1]])
        test([1,2,3].groupBy(eq), [[1], [2], [3] ])
        test([1,2,2,3,2].groupBy(eq), [[1], [2,2,2], [3]])
        test([1,2,3,1,2,3].groupBy(eq), [[1,1], [2,2], [3,3]])
    }
    
    func testIntersperse() {
        XCTAssertEqual([1,2,3].intersperse(0), [1,0,2,0,3])
        XCTAssertEqual([1].intersperse(0), [1])
        XCTAssertEqual([].intersperse(0), [])
    }

}
