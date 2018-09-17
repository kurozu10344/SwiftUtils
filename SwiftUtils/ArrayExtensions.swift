//
//  ArrayExtensions.swift
//  SwiftUtils
//
//  Created by Hiroaki Tomiyoshi on 2018/09/17.
//  Copyright © 2018年 Hiroaki Tomiyoshi. All rights reserved.
//

import Foundation

public extension Array {
    
    public subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    public var second: SubSequence.Iterator.Element? {
        return self.dropFirst().first
    }
    
    public func groupBy(_ predicate: (Element, Element) -> Bool) -> [[Element]] {
        var groups: [[Element]] = []
        for e in self {
            if let index = groups.index(where: { predicate(e, $0.first!) }) {
                groups[index].append(e)
            }
            else {
                groups.append([e])
            }
        }
        return groups
    }
    
    public func intersperse(_ element: Element) -> [Element] {
        var newArray: [Element] = []
        self.forEach {
            newArray.append($0)
            newArray.append(element)
        }
        return Array(newArray.dropLast())
    }
    
}
