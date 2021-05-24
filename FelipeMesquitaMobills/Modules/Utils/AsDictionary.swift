//
//  AsDictionary.swift
//  FelipeMesquitaMobills
//
//  Created by Felipe Mesquita on 24/05/21.
//

import Foundation

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}

extension Decodable {
    func asData() throws -> Data {
        return try PropertyListSerialization.data(fromPropertyList: self, format: PropertyListSerialization.PropertyListFormat.binary, options: 0)
    }
}
