//
//  CoreServiceCodable.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-08-30.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//


import Foundation

public protocol CoreServiceCodable: Codable {}

extension CoreServiceCodable {

    public static func from<T>(data: Data) -> T? where T: Codable {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch let ex {
            print("Unable to decode \(T.self): \(ex.localizedDescription)")
        }

        return nil
    }

    public static func arrayFrom<T>(data: Data) -> [T]? where T: Codable {
        do {
            return try JSONDecoder().decode([T].self, from: data)
        } catch let ex {
            print("Unable to decode array \(T.self): \(ex.localizedDescription)")
        }

        return nil
    }

    var dictionary: [String: Any] {
        do {
            guard let data = data else { return [:] }
            return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] ?? [:]
        } catch let ex {
            print("Unable to encode \(self): \(ex.localizedDescription)")
        }
        return [:]
    }

    public var data: Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch let ex {
            print("Unable to encode \(self): \(ex.localizedDescription)")
        }

        return nil
    }
}
