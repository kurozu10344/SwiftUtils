//
//  Operators.swift
//  SwiftUtils
//
//  Created by Hiroaki Tomiyoshi on 2018/09/09.
//  Copyright © 2018年 Hiroaki Tomiyoshi. All rights reserved.
//

import Foundation

infix operator =? : AssignmentPrecedence

/// Assign rhs to lhs only if not nil
public func =? <T>(lhs: inout T, rhs: T?) {
    if let rhs = rhs {
        lhs = rhs
    }
}

/// Assign rhs to lhs only if not nil
public func =? <T>(lhs: inout T?, rhs: T?) {
    if let rhs = rhs {
        lhs = rhs
    }
}
