//
//  StringExtensionsTests.swift
//  SwiftUtilsTests
//
//  Created by Hiroaki Tomiyoshi on 2018/09/17.
//  Copyright © 2018年 Hiroaki Tomiyoshi. All rights reserved.
//

import XCTest
import SwiftUtils

class StringExtensionsTests: XCTestCase {
    
    func testSeparatedByCounts() {
        var list: [String]
        var remains: String
        
        (list, remains) = "abcdefg".separated(by: [1,2,3])
        XCTAssertEqual(list, ["a","bc","def"])
        XCTAssertEqual(remains, "g")
        
        (list, remains) = "abcdef".separated(by: [1,2,3])
        XCTAssertEqual(list, ["a","bc","def"])
        XCTAssertEqual(remains, "")
        
        (list, remains) = "abcdef".separated(by: [1,2,4])
        XCTAssertEqual(list, ["a","bc","def"])
        XCTAssertEqual(remains, "")
        
        (list, remains) = "abcdef".separated(by: [1,2,3,4])
        XCTAssertEqual(list, ["a","bc","def"])
        XCTAssertEqual(remains, "")
        
        (list, remains) = "abcdef".separated(by: [5])
        XCTAssertEqual(list, ["abcde"])
        XCTAssertEqual(remains, "f")
        
        (list, remains) = "abcdef".separated(by: [6])
        XCTAssertEqual(list, ["abcdef"])
        XCTAssertEqual(remains, "")
        
        (list, remains) = "abcdef".separated(by: [7])
        XCTAssertEqual(list, ["abcdef"])
        XCTAssertEqual(remains, "")
        
        (list, remains) = "abcdef".separated(by: [])
        XCTAssertEqual(list, [])
        XCTAssertEqual(remains, "abcdef")
        
        (list, remains) = "あいうえおかきくけこ".separated(by: [1,2,3])
        XCTAssertEqual(list, ["あ","いう","えおか"])
        XCTAssertEqual(remains, "きくけこ")
        
        (list, remains) = "😄😆😅😓😢".separated(by: [1,2])
        XCTAssertEqual(list, ["😄","😆😅"])
        XCTAssertEqual(remains, "😓😢")
    }
    
    func testTrimHead() {
        XCTAssertEqual("@123".trimHead("@"), "123")
        XCTAssertEqual("@@@123".trimHead("@"), "123")
        
        XCTAssertEqual("123@@@".trimHead("@"), "123@@@")
        XCTAssertEqual("@1@2@3@".trimHead("@"), "1@2@3@")
        
        XCTAssertEqual("".trimHead("@"), "")
        XCTAssertEqual("@@@".trimHead("@"), "")
    }
    
    func testTrimTail() {
        XCTAssertEqual("123@".trimTail("@"), "123")
        XCTAssertEqual("123@@@".trimTail("@"), "123")
        
        XCTAssertEqual("@@@123".trimTail("@"), "@@@123")
        XCTAssertEqual("@1@2@3@".trimTail("@"), "@1@2@3")
        
        XCTAssertEqual("".trimTail("@"), "")
        XCTAssertEqual("@@@".trimTail("@"), "")
    }

    func testReplace() {
        XCTAssertEqual("123abcabcabc".replace(regularExpressionPattern: "(abc)+", toString: "0"), "1230")
        XCTAssertEqual("\r\n\r\n\r\nabc".replace(regularExpressionPattern: "(\\r\\n)+", toString: "\r\n"), "\r\nabc")
        XCTAssertEqual("abc\r\n\r\n\r\n".replace(regularExpressionPattern: "(\\r\\n)+", toString: "\r\n"), "abc\r\n")
        
        XCTAssertEqual("123".replace(regularExpressionPattern: "\\d+", toString: "abc"), "abc")
        XCTAssertEqual("123abc123abc123".replace(regularExpressionPattern: "\\d+", toString: "0"), "0abc0abc0")
        XCTAssertNotEqual("aaa".replace(regularExpressionPattern: "\\d+", toString: "abc"), "abc")
        XCTAssertEqual("\r\n\r\n\r\nabc\r\n\r\n\r\ndef\r\n\r\n\r\n".replace(regularExpressionPattern: "(\\r\\n)+", toString: "\r\n"), "\r\nabc\r\ndef\r\n")
        XCTAssertEqual("\n\n\nabc\n\n\ndef\n\n\n".replace(regularExpressionPattern: "\\n+", toString: "\n"), "\nabc\ndef\n")
    }
    
    func testIsMatch() {
        XCTAssertTrue("123".isMatch(regularExpressionPattern: "\\d+"))
        XCTAssertTrue("abc123abc".isMatch(regularExpressionPattern: "\\d+"))
        XCTAssertFalse("abc".isMatch(regularExpressionPattern: "\\d+"))
    }
    
    func testMatches() {
        XCTAssertEqual("123".matches(regularExpressionPattern: "\\d+"), ["123"])
        XCTAssertEqual("123abc456".matches(regularExpressionPattern: "\\d+"), ["123", "456"])
        XCTAssertEqual("abc".matches(regularExpressionPattern: "\\d+"), [])
    }

}
