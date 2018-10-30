//
//  DateExtensions.swift
//  SwiftUtils
//
//  Created by Hiroaki Tomiyoshi on 2018/09/09.
//  Copyright © 2018年 Hiroaki Tomiyoshi. All rights reserved.
//

import Foundation

public extension Date {
    
    public static func from(year: Int,
                            month: Int,
                            day: Int) -> Date?
    {
        let calendar = Calendar(identifier: .gregorian)
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        return calendar.date(from: components)
    }
    
    public static func from(string: String, usingFormat dateFormat: String) -> Date? {
        guard string.count == dateFormat.count else {
            return nil
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: string)
    }
    
    public var year: Int {
        return Calendar(identifier: .gregorian).component(Calendar.Component.year, from: self)
    }
    public var month: Int {
        return Calendar(identifier: .gregorian).component(Calendar.Component.month, from: self)
    }
    public var day: Int {
        return Calendar(identifier: .gregorian).component(Calendar.Component.day, from: self)
    }
    public var hour: Int {
        return Calendar(identifier: .gregorian).component(Calendar.Component.hour, from: self)
    }
    public var minute: Int {
        return Calendar(identifier: .gregorian).component(Calendar.Component.minute, from: self)
    }
    public var second: Int {
        return Calendar(identifier: .gregorian).component(Calendar.Component.second, from: self)
    }
    
    public func yearsAgo(_ year: Int) -> Date? {
        return Date.from(year: self.year - year,
                         month: self.month,
                         day: self.day)
    }
    
    public func yearsLater(_ year: Int) -> Date? {
        return Date.from(year: self.year + year,
                         month: self.month,
                         day: self.day)
    }
    
    public func monthsAgo(_ month: Int) -> Date? {
        let calendar = Calendar(identifier: .gregorian)
        var component = DateComponents()
        component.month = -month
        return calendar.date(byAdding: component, to: self)
    }
    
    public func monthsLater(_ month: Int) -> Date? {
        let calendar = Calendar(identifier: .gregorian)
        var component = DateComponents()
        component.month = month
        return calendar.date(byAdding: component, to: self)
    }
    
    public func daysAgo(_ day: Int) -> Date? {
        let calendar = Calendar(identifier: .gregorian)
        var component = DateComponents()
        component.day = -day
        return calendar.date(byAdding: component, to: self)
    }
    
    public func daysLater(_ day: Int) -> Date? {
        let calendar = Calendar(identifier: .gregorian)
        var component = DateComponents()
        component.day = day
        return calendar.date(byAdding: component, to: self)
    }
    
    public func countDaysBetween(_ toDate: Date) -> Int? {
        let calendar = Calendar(identifier: .gregorian)
        guard
            let fromDay = calendar.ordinality(of: .day, in: .era, for: self),
            let toDay = calendar.ordinality(of: .day, in: .era, for: toDate)
            else { return nil }
        return toDay - fromDay
    }
    
    public func string(usingFormat dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: self)
    }
}
