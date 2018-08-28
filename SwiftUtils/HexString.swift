//
//  HexString.swift
//  SwiftUtils
//
//  Created by Hiroaki Tomiyoshi on 2018/08/29.
//  Copyright © 2018年 Hiroaki Tomiyoshi. All rights reserved.
//

import Foundation

public extension Data {
    public var hexString: String {
        var bytes = Array<UInt8>(repeating: 0, count: self.count)
        self.copyBytes(to: &bytes, count: self.count)
        
        let hexString = NSMutableString()
        for byte in bytes {
            hexString.appendFormat("%02x", UInt(byte))
        }
        
        return hexString as String
    }
}
