//
//  JSONTests.swift
//  SwiftUtils
//
//  Created by Hiroaki Tomiyoshi on 2018/09/02.
//  Copyright © 2018年 Hiroaki Tomiyoshi. All rights reserved.
//

import XCTest
import SwiftUtils

class JSONTests: XCTestCase {
    
    func testJSON() {
        let jsonString = """
{
    "string": "abc",
    "int": 123,
    "bool": true,
    "dictionary": {
        "child": "c"
    },
    "array": [
              "child0",
              "child1",
              "child2"
              ],
}
"""
        let json = try! JSON(data: jsonString.data(using: .utf8)!)
        
        XCTAssertEqual(json["string"].string, "abc")
        XCTAssertEqual(json["string"].stringValue, "abc")
        XCTAssertEqual(json["int"].int, 123)
        XCTAssertEqual(json["int"].intValue, 123)
        XCTAssertEqual(json["bool"].bool, true)
        XCTAssertEqual(json["bool"].boolValue, true)
        XCTAssertEqual(json["dictionary"].dictionary?["child"]?.stringValue, "c")
        XCTAssertEqual(json["dictionary"].dictionaryValue["child"]?.stringValue, "c")
        XCTAssertEqual(json["array"].array?[0].stringValue, "child0")
        XCTAssertEqual(json["array"].array?[1].stringValue, "child1")
        XCTAssertEqual(json["array"].array?[2].stringValue, "child2")
        
        // Non existing key(Nilable)
        XCTAssertNil(json["???"].string)
        XCTAssertNil(json["???"].int)
        XCTAssertNil(json["???"].bool)
        XCTAssertNil(json["???"].dictionary)
        XCTAssertNil(json["???"].array)
        
        // Non existing key(Nilable value)
        XCTAssertEqual(json["???"].stringValue, "")
        XCTAssertEqual(json["???"].intValue, 0)
        XCTAssertEqual(json["???"].boolValue, false)
        XCTAssertTrue(json["???"].dictionaryValue.isEmpty)
        XCTAssertTrue(json["???"].arrayValue.isEmpty)
    }
    
}
