//
//  CollectionExtensions.swift
//  SwiftUtils
//
//  Created by Hiroaki Tomiyoshi on 2018/09/17.
//  Copyright © 2018年 Hiroaki Tomiyoshi. All rights reserved.
//

import Foundation

public extension Collection {
    public func appropriateAll(predicate: (Self.Iterator.Element) -> Bool) -> Bool {
        for element in self {
            if !predicate(element) {
                return false
            }
        }
        return true
    }
}
