//
//  DictionaryExtensions.swift
//  SwiftUtils
//
//  Created by Hiroaki Tomiyoshi on 2018/09/29.
//  Copyright © 2018 Hiroaki Tomiyoshi. All rights reserved.
//

import Foundation

public func + <K, V> (left: [K:V], right: [K:V]) -> [K:V] {
    var dict = Dictionary<K, V>()
    left.forEach { key, value in dict[key] = value }
    right.forEach { key, value in dict[key] = value }
    return dict
}

public func += <K, V> (left: inout [K:V], right: [K:V]) {
    right.forEach { key, value in left[key] = value }
}
