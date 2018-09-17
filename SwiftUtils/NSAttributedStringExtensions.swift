//
//  NSAttributedStringExtensions.swift
//  SwiftUtils
//
//  Created by Hiroaki Tomiyoshi on 2018/09/17.
//  Copyright © 2018年 Hiroaki Tomiyoshi. All rights reserved.
//

import Foundation

// Concatenate NSAttributedString
public func + (left: NSAttributedString, right: NSAttributedString) -> NSAttributedString
{
    let result = NSMutableAttributedString()
    result.append(left)
    result.append(right)
    return result.copy() as! NSAttributedString
}
