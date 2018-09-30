//
//  CryptoTests.swift
//  SwiftUtilsTests
//
//  Created by Hiroaki Tomiyoshi on 2018/09/30.
//  Copyright © 2018 Hiroaki Tomiyoshi. All rights reserved.
//

import XCTest

class CryptoTests: XCTestCase {
    
    func testSHA1Data() {
        XCTAssertTrue("test\n".data(using: .ascii)!.sha1Data.hexString.caseInsensitiveCompare("4e1243bd22c66e76c2ba9eddc1f91394e57f9f83") == .orderedSame)
        XCTAssertTrue("1234567890\n".data(using: .ascii)!.sha1Data.hexString.caseInsensitiveCompare("12039d6dd9a7e27622301e935b6eefc78846802e") == .orderedSame)
    }
    
    func testDes() {
        let key = "testtest".data(using: .ascii)!
        
        XCTAssertEqual(Data(base64Encoded: "wvIfiwwYjzI=")!.desDecryptedData(key: key)!,
                       "testdata".data(using: .ascii)!)
        
        // padding(PKCS7)
        XCTAssertEqual(Data(base64Encoded: "QQm66vsz/9M=")!.desDecryptedData(key: key)!,
                       "1111111".data(using: .ascii)!)
        XCTAssertEqual(Data(base64Encoded: "p1aVTDyqyM4=")!.desDecryptedData(key: key)!,
                       "222222".data(using: .ascii)!)
        XCTAssertEqual(Data(base64Encoded: "rRYUDAZAYFk=")!.desDecryptedData(key: key)!,
                       "33333".data(using: .ascii)!)
        XCTAssertEqual(Data(base64Encoded: "MgEjmUp0vrw=")!.desDecryptedData(key: key)!,
                       "4444".data(using: .ascii)!)
        XCTAssertEqual(Data(base64Encoded: "JUEsVkcHagE=")!.desDecryptedData(key: key)!,
                       "555".data(using: .ascii)!)
        XCTAssertEqual(Data(base64Encoded: "1bO8/mHYGv4=")!.desDecryptedData(key: key)!,
                       "66".data(using: .ascii)!)
        XCTAssertEqual(Data(base64Encoded: "kZgfoNUOe4g=")!.desDecryptedData(key: key)!,
                       "7".data(using: .ascii)!)
        XCTAssertEqual(Data(base64Encoded: "IOTjPU02eb/N18eCGbDgng==")!.desDecryptedData(key: key)!,
                       "88888888".data(using: .ascii)!)
    }

}
