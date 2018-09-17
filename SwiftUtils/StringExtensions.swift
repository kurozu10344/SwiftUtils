//
//  StringExtensions.swift
//  SwiftUtils
//
//  Created by Hiroaki Tomiyoshi on 2018/09/17.
//  Copyright © 2018年 Hiroaki Tomiyoshi. All rights reserved.
//

import Foundation

public extension String {
    public func size(with font: UIFont) -> CGSize {
        let attributes = [NSAttributedStringKey.font: font]
        return (self as NSString).size(withAttributes: attributes)
    }

    public func separated(toFitInWidth width: CGFloat, using font: UIFont) -> (String, String?) {
        guard !isEmpty && size(with: font).width > width else {
            return (self, nil)
        }

        var separated = self
        var remains = ""
        while separated.size(with: font).width > width {
            guard let lastCharacter = separated.last else {
                break
            }
            separated = String(separated.dropLast())
            remains.insert(lastCharacter, at: remains.startIndex)
        }

        return (separated, remains)
    }

    public func separated(by counts: [Int]) -> ([String], String) {
        let (separatedStrings, remains): ([String], String) = counts.reduce(([], self), { (result: ([String], String), count) in
            let (partial, remains) = result
            if remains.isEmpty {
                return (partial, "")
            } else if remains.count <= count {
                return (partial + [remains], "")
            } else {
                let index = remains.index(remains.startIndex, offsetBy: count)
                let sliced = remains[..<index]
                let newRemains = remains[index...]
                return (partial + [String(sliced)], String(newRemains))
            }
        })
        return (separatedStrings, remains)
    }

    public func trimHead(_ character: Character) -> String {
        guard !isEmpty else { return self }
        guard let i = index(where: { $0 != character }) else { return "" }
        return String(self[i...])
    }

    public func trimTail(_ character: Character) -> String {
        guard !isEmpty else { return self }

        func findTail(_ i: Index) -> Index {
            guard i != startIndex else { return i }
            let before = index(before: i)
            if self[before] == character {
                return findTail(before)
            }
            return i
        }

        let i = findTail(endIndex)
        return String(self[..<i])
    }
    
    
    // MARK: - RegularExpressions
    
    public func replace(regularExpressionPattern regexPattern: String,
                        toString replaceString: String,
                        options: NSRegularExpression.Options = []) -> String
    {
        let range = NSMakeRange(0, unicodeScalars.count) // characters.countでは"\r\n"が1文字としてカウントされるため、unicodeScalarsを使用
        return (try? NSRegularExpression(pattern: regexPattern, options: options))?
            .stringByReplacingMatches(in: self,
                                      options: [],
                                      range: range,
                                      withTemplate: replaceString)
            ?? self
    }
    
    public func isMatch(regularExpressionPattern regexPattern: String,
                        options: NSRegularExpression.Options = [],
                        matchingOptions: NSRegularExpression.MatchingOptions = []) -> Bool
    {
        let range = NSMakeRange(0, unicodeScalars.count) // characters.countでは"\r\n"が1文字としてカウントされるため、unicodeScalarsを使用
        return (try? NSRegularExpression(pattern: regexPattern, options: options))?
            .matches(in: self,
                     options: matchingOptions,
                     range: range)
            .isEmpty == false
    }
    
    public func matches(regularExpressionPattern regexPattern: String,
                        options: NSRegularExpression.Options = [],
                        matchingOptions: NSRegularExpression.MatchingOptions = []) -> [String]
    {
        let range = NSMakeRange(0, unicodeScalars.count) // characters.countでは"\r\n"が1文字としてカウントされるため、unicodeScalarsを使用
        return (try? NSRegularExpression(pattern: regexPattern, options: options))?
            .matches(in: self,
                     options: matchingOptions,
                     range: range)
            .map { (self as NSString).substring(with: $0.range) }
            ?? []
    }
}
