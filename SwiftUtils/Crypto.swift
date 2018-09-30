//
//  Crypto.swift
//  SwiftUtils
//
//  Created by Hiroaki Tomiyoshi on 2018/09/30.
//  Copyright © 2018 Hiroaki Tomiyoshi. All rights reserved.
//

import Foundation
import CommonCrypto

// Hash functions
public extension Data {
    
    /// SHA1
    public var sha1Data: Data {
        let digestLength = Int(CC_SHA1_DIGEST_LENGTH)
        let bytes: UnsafeRawPointer = (self as NSData).bytes
        var sha1Bytes = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        CC_SHA1(bytes, UInt32(self.count), &sha1Bytes)
        return Data(bytes: sha1Bytes, count: digestLength)
    }
}

// DES encrypt
public extension Data {
    
    public func desDecryptedData(key: Data) -> Data? {
        let dataInLength = self.count
        let dataOutLength = dataInLength + kCCBlockSizeDES
        var dataOut = Data(count: dataOutLength)
        var decryptedSize: Int = 0
        let cryptStatus = key.withUnsafeBytes { keyPointer in
            self.withUnsafeBytes { dataInPointer in
                dataOut.withUnsafeMutableBytes { dataOutPointer in
                    CCCrypt(CCOperation(kCCDecrypt),
                            CCAlgorithm(kCCAlgorithmDES),
                            CCOptions(kCCOptionPKCS7Padding),
                            keyPointer, kCCKeySizeDES,
                            nil,
                            dataInPointer, dataInLength,
                            dataOutPointer, dataOutLength,
                            &decryptedSize)
                }
            }
        }
        
        if cryptStatus == CCCryptorStatus(kCCSuccess) {
            dataOut.count = decryptedSize
            return dataOut
        }
        return nil
    }
    
}
