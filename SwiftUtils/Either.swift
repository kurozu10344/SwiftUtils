//
//  Either.swift
//  SwiftUtils
//
//  Created by Hiroaki Tomiyoshi on 2018/09/09.
//  Copyright © 2018年 Hiroaki Tomiyoshi. All rights reserved.
//

import Foundation

public enum Either<L, R> {
    case left(L)
    case right(R)
}
