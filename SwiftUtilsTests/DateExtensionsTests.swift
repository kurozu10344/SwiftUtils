//
//  DateExtensionsTests.swift
//  SwiftUtilsTests
//
//  Created by Hiroaki Tomiyoshi on 2018/09/09.
//  Copyright © 2018年 Hiroaki Tomiyoshi. All rights reserved.
//

import XCTest
@testable import SwiftUtils

class DateExtensionsTests: XCTestCase {
    
    func testFromYearMonthDay() {
        var date: Date? = nil
        
        date = Date.from(year: 2000, month: 1, day: 1)
        XCTAssertEqual(date?.year, 2000)
        XCTAssertEqual(date?.month, 1)
        XCTAssertEqual(date?.day, 1)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
        
        date = Date.from(year: 2000, month: 12, day: 31)
        XCTAssertEqual(date?.year, 2000)
        XCTAssertEqual(date?.month, 12)
        XCTAssertEqual(date?.day, 31)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
        
        date = Date.from(year: 2000, month: 13, day: 1)
        XCTAssertEqual(date?.year, 2001)
        XCTAssertEqual(date?.month, 1)
        XCTAssertEqual(date?.day, 1)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
        
        date = Date.from(year: 2000, month: 1, day: 32)
        XCTAssertEqual(date?.year, 2000)
        XCTAssertEqual(date?.month, 2)
        XCTAssertEqual(date?.day, 1)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
        
        date = Date.from(year: 2000, month: 12, day: 32)
        XCTAssertEqual(date?.year, 2001)
        XCTAssertEqual(date?.month, 1)
        XCTAssertEqual(date?.day, 1)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
    }
    
    func testFromString() {
        var date: Date? = nil
        
        date = Date.from(string: "2000-01-01", usingFormat: "yyyy-MM-dd")
        XCTAssertEqual(date?.year, 2000)
        XCTAssertEqual(date?.month, 1)
        XCTAssertEqual(date?.day, 1)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
        
        date = Date.from(string: "2000-12-31", usingFormat: "yyyy-MM-dd")
        XCTAssertEqual(date?.year, 2000)
        XCTAssertEqual(date?.month, 12)
        XCTAssertEqual(date?.day, 31)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
        
        date = Date.from(string: "2000-13-01", usingFormat: "yyyy-MM-dd")
        XCTAssertNil(date)

        date = Date.from(string: "2000-01-32", usingFormat: "yyyy-MM-dd")
        XCTAssertNil(date)

        date = Date.from(string: "2000-12-32", usingFormat: "yyyy-MM-dd")
        XCTAssertNil(date)
    }
    
    func testYearsAgo() {
        var date: Date? = nil
        
        date = Date.from(year: 2000, month: 1, day: 1)?.yearsAgo(1)
        XCTAssertEqual(date?.year, 1999)
        XCTAssertEqual(date?.month, 1)
        XCTAssertEqual(date?.day, 1)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
    }
    
    func testYearsLater() {
        var date: Date? = nil
        
        date = Date.from(year: 2000, month: 1, day: 1)?.yearsLater(1)
        XCTAssertEqual(date?.year, 2001)
        XCTAssertEqual(date?.month, 1)
        XCTAssertEqual(date?.day, 1)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
    }
    
    func testMonthsAgo() {
        var date: Date? = nil
        
        date = Date.from(year: 2000, month: 6, day: 1)?.monthsAgo(1)
        XCTAssertEqual(date?.year, 2000)
        XCTAssertEqual(date?.month, 5)
        XCTAssertEqual(date?.day, 1)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
        
        date = Date.from(year: 2000, month: 6, day: 1)?.monthsAgo(5)
        XCTAssertEqual(date?.year, 2000)
        XCTAssertEqual(date?.month, 1)
        XCTAssertEqual(date?.day, 1)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
        
        date = Date.from(year: 2000, month: 6, day: 1)?.monthsAgo(6)
        XCTAssertEqual(date?.year, 1999)
        XCTAssertEqual(date?.month, 12)
        XCTAssertEqual(date?.day, 1)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
    }
    
    func testMonthsLater() {
        var date: Date? = nil
        
        date = Date.from(year: 2000, month: 6, day: 1)?.monthsLater(1)
        XCTAssertEqual(date?.year, 2000)
        XCTAssertEqual(date?.month, 7)
        XCTAssertEqual(date?.day, 1)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
        
        date = Date.from(year: 2000, month: 6, day: 1)?.monthsLater(6)
        XCTAssertEqual(date?.year, 2000)
        XCTAssertEqual(date?.month, 12)
        XCTAssertEqual(date?.day, 1)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
        
        date = Date.from(year: 2000, month: 6, day: 1)?.monthsLater(7)
        XCTAssertEqual(date?.year, 2001)
        XCTAssertEqual(date?.month, 1)
        XCTAssertEqual(date?.day, 1)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
    }
    
    func testDaysAgo() {
        var date: Date? = nil
        
        date = Date.from(year: 2000, month: 1, day: 15)?.daysAgo(1)
        XCTAssertEqual(date?.year, 2000)
        XCTAssertEqual(date?.month, 1)
        XCTAssertEqual(date?.day, 14)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
        
        date = Date.from(year: 2000, month: 1, day: 15)?.daysAgo(14)
        XCTAssertEqual(date?.year, 2000)
        XCTAssertEqual(date?.month, 1)
        XCTAssertEqual(date?.day, 1)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
        
        date = Date.from(year: 2000, month: 1, day: 15)?.daysAgo(15)
        XCTAssertEqual(date?.year, 1999)
        XCTAssertEqual(date?.month, 12)
        XCTAssertEqual(date?.day, 31)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
    }
    
    func testDaysLater() {
        var date: Date? = nil
        
        date = Date.from(year: 2000, month: 1, day: 15)?.daysLater(1)
        XCTAssertEqual(date?.year, 2000)
        XCTAssertEqual(date?.month, 1)
        XCTAssertEqual(date?.day, 16)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
        
        date = Date.from(year: 2000, month: 1, day: 15)?.daysLater(16)
        XCTAssertEqual(date?.year, 2000)
        XCTAssertEqual(date?.month, 1)
        XCTAssertEqual(date?.day, 31)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
        
        date = Date.from(year: 2000, month: 1, day: 15)?.daysLater(17)
        XCTAssertEqual(date?.year, 2000)
        XCTAssertEqual(date?.month, 2)
        XCTAssertEqual(date?.day, 1)
        XCTAssertEqual(date?.hour, 0)
        XCTAssertEqual(date?.minute, 0)
        XCTAssertEqual(date?.second, 0)
    }
    
    func testString() {
        var dateComponents = DateComponents()
        dateComponents.year = 2000
        dateComponents.month = 1
        dateComponents.day = 2
        dateComponents.hour = 3
        dateComponents.minute = 4
        dateComponents.second = 5
        let date = Calendar(identifier: .gregorian).date(from: dateComponents)!
        
        XCTAssertEqual(date.string(usingFormat: "yyyy-MM-dd HH:mm:ss"), "2000-01-02 03:04:05")
    }
    

}
