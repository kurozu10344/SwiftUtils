//
//  URLEncode.swift
//  SwiftUtils
//
//  Created by Hiroaki Tomiyoshi on 2018/09/09.
//  Copyright © 2018年 Hiroaki Tomiyoshi. All rights reserved.
//

import Foundation

// URLEncode implementation
// https://www.ietf.org/rfc/rfc3986.txt

public extension String {
    public func URLEncodedString(encoding: String.Encoding = .shiftJIS) -> String? {
        guard let data = self.data(using: encoding) else {
            return nil
        }
        let bytes: Array<UInt8> = {
            var bytes = Array<UInt8>(repeating: 0, count: data.count)
            data.copyBytes(to: &bytes, count: data.count)
            return bytes
        }()
        let encodedData = NSMutableData()
        for var byte in bytes {
            if byte.isUnreservedCharacter() {
                encodedData.append(&byte, length: 1)
            }
            else {
                let encodedString = "%\(byte.toHexString())"
                encodedString.withCString {
                    encodedData.append($0, length: encodedString.lengthOfBytes(using: String.Encoding.ascii))
                }
            }
        }
        return String(data: encodedData as Data, encoding: .ascii)
    }
}

private extension UInt8 {
    func isUnreservedCharacter() -> Bool {
        return isalpha(Int32(self)) != 0
            || isdigit(Int32(self)) != 0
            || self == 0x2d // '-'
            || self == 0x2e // '.'
            || self == 0x5f // '_'
            || self == 0x7e // '~'
    }
    func toHexString() -> String {
        return String(format: "%02X", arguments: [self])
    }
}
