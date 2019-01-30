//
//  URLEncodeTests.swift
//  SwiftUtilsTests
//
//  Created by Hiroaki Tomiyoshi on 2018/09/09.
//  Copyright © 2018年 Hiroaki Tomiyoshi. All rights reserved.
//

import XCTest
import SwiftUtils

class URLEncodeTests: XCTestCase {
    func testURLEncodedString() {
        // Unreserved Characters
        XCTAssertEqual("a".URLEncodedString(encoding: .utf8), "a")
        XCTAssertEqual("z".URLEncodedString(encoding: .utf8), "z")
        XCTAssertEqual("A".URLEncodedString(encoding: .utf8), "A")
        XCTAssertEqual("Z".URLEncodedString(encoding: .utf8), "Z")
        XCTAssertEqual("0".URLEncodedString(encoding: .utf8), "0")
        XCTAssertEqual("9".URLEncodedString(encoding: .utf8), "9")
        XCTAssertEqual("-".URLEncodedString(encoding: .utf8), "-")
        XCTAssertEqual(".".URLEncodedString(encoding: .utf8), ".")
        XCTAssertEqual("_".URLEncodedString(encoding: .utf8), "_")
        XCTAssertEqual("~".URLEncodedString(encoding: .utf8), "~")
        
        // ASCII
        XCTAssertEqual(" ".URLEncodedString(encoding: .utf8), "%20")
        XCTAssertEqual("!".URLEncodedString(encoding: .utf8), "%21")
        XCTAssertEqual("\"".URLEncodedString(encoding: .utf8), "%22")
        XCTAssertEqual("#".URLEncodedString(encoding: .utf8), "%23")
        XCTAssertEqual("$".URLEncodedString(encoding: .utf8), "%24")
        XCTAssertEqual("%".URLEncodedString(encoding: .utf8), "%25")
        XCTAssertEqual("&".URLEncodedString(encoding: .utf8), "%26")
        XCTAssertEqual("'".URLEncodedString(encoding: .utf8), "%27")
        XCTAssertEqual("(".URLEncodedString(encoding: .utf8), "%28")
        XCTAssertEqual(")".URLEncodedString(encoding: .utf8), "%29")
        XCTAssertEqual("*".URLEncodedString(encoding: .utf8), "%2A")
        XCTAssertEqual("+".URLEncodedString(encoding: .utf8), "%2B")
        XCTAssertEqual(",".URLEncodedString(encoding: .utf8), "%2C")
        XCTAssertEqual("/".URLEncodedString(encoding: .utf8), "%2F")
        XCTAssertEqual(":".URLEncodedString(encoding: .utf8), "%3A")
        XCTAssertEqual(";".URLEncodedString(encoding: .utf8), "%3B")
        XCTAssertEqual("<".URLEncodedString(encoding: .utf8), "%3C")
        XCTAssertEqual("=".URLEncodedString(encoding: .utf8), "%3D")
        XCTAssertEqual(">".URLEncodedString(encoding: .utf8), "%3E")
        XCTAssertEqual("?".URLEncodedString(encoding: .utf8), "%3F")
        XCTAssertEqual("@".URLEncodedString(encoding: .utf8), "%40")
        XCTAssertEqual("[".URLEncodedString(encoding: .utf8), "%5B")
        XCTAssertEqual("\\".URLEncodedString(encoding: .utf8), "%5C")
        XCTAssertEqual("]".URLEncodedString(encoding: .utf8), "%5D")
        XCTAssertEqual("^".URLEncodedString(encoding: .utf8), "%5E")
        XCTAssertEqual("`".URLEncodedString(encoding: .utf8), "%60")
        XCTAssertEqual("{".URLEncodedString(encoding: .utf8), "%7B")
        XCTAssertEqual("|".URLEncodedString(encoding: .utf8), "%7C")
        XCTAssertEqual("}".URLEncodedString(encoding: .utf8), "%7D")
        
        // Multi Byte (UTF-8)
        XCTAssertEqual("あ".URLEncodedString(encoding: .utf8), "%E3%81%82")
        XCTAssertEqual("あいう".URLEncodedString(encoding: .utf8), "%E3%81%82%E3%81%84%E3%81%86")

        // Multi Byte (Shift_JIS)
        XCTAssertEqual("あ".URLEncodedString(encoding: .shiftJIS), "%82%A0")
        XCTAssertEqual("あいう".URLEncodedString(encoding: .shiftJIS), "%82%A0%82%A2%82%A4")
        
        // Multi Byte (Emoji)
        XCTAssertEqual("😄".URLEncodedString(encoding: .utf8), "%F0%9F%98%84")  // U+1F604 SMILING FACE WITH OPEN MOUTH AND SMILING EYES
        XCTAssertEqual("👍" .URLEncodedString(encoding: .utf8), "%F0%9F%91%8D") // U+1F44D THUMBS UP SIGNES
    }
}
