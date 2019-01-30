//
//  JSON.swift
//  SwiftUtils
//
//  Created by Hiroaki Tomiyoshi on 2018/09/02.
//  Copyright © 2018年 Hiroaki Tomiyoshi. All rights reserved.
//

import Foundation

/// Simple JSON object wrapper
public struct JSON {
    let rawValue: Any
    
    public init(_ jsonObject: Any) {
        switch jsonObject {
        case let json as JSON:
            self.rawValue = json.rawValue
        default:
            self.rawValue = jsonObject
        }
    }
    public init(data: Data, options: JSONSerialization.ReadingOptions = []) throws {
        self.rawValue = try JSONSerialization.jsonObject(with: data, options: options)
    }

    public var data: Data? {
        return try? JSONSerialization.data(withJSONObject: rawValue, options: [])
    }
    
    public subscript(key: String) -> JSON {
        let obj = self.dictionary?[key]
        return JSON(obj as Any)
    }
    
    public var dictionary: [String: JSON]? {
        guard let anyDict = self.rawValue as? [String: Any] else { return nil }
        var dict = [String: JSON]()
        anyDict.forEach { (key, value) in
            dict[key] = JSON(value)
        }
        return dict
    }
    public var dictionaryValue: [String: JSON] {
        return dictionary ?? [:]
    }
    public var array: [JSON]? {
        guard let anyArray = self.rawValue as? [Any] else { return nil }
        return anyArray.map { JSON($0) }
    }
    public var arrayValue: [JSON] {
        return array ?? []
    }
    public var int: Int? {
        return self.rawValue as? Int
    }
    public var intValue: Int {
        return int ?? 0
    }
    public var string: String? {
        return self.rawValue as? String
    }
    public var stringValue: String {
        return string ?? ""
    }
    public var bool: Bool? {
        return self.rawValue as? Bool
    }
    public var boolValue: Bool {
        return bool ?? false
    }
}

/// JSON encodable protocol
public protocol ToJSON {
    func toJSON() -> Any
    func toJSONData() throws -> Data
}
public extension ToJSON {
    public func toJSONData() throws -> Data {
        return try JSONSerialization.data(withJSONObject: toJSON(), options: [])
    }
}

/// JSON decodable protocol
public protocol FromJSON {
    init(_ jsonObject: Any) throws
    init(_ jsonObject: JSON) throws
    static func fromJSON(_ jsonObject: Any) throws -> Self
    static func fromJSON(_ jsonObject: JSON) throws -> Self
    static func fromJSONData(_ jsonData: Data) throws -> Self
}
public extension FromJSON {
    public init(_ jsonObject: JSON) throws {
        try self.init(jsonObject.rawValue)
    }
    public static func fromJSON(_ jsonObject: Any) throws -> Self {
        return try Self.init(jsonObject)
    }
    public static func fromJSON(_ jsonObject: JSON) throws -> Self {
        return try fromJSON(jsonObject.rawValue)
    }
    public static func fromJSONData(_ jsonData: Data) throws -> Self {
        let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
        return try fromJSON(jsonObject)
    }
}
