//
//  Serializable.swift
//  GitHubRating
//
//  Created by dede.exe on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import Foundation

protocol Serializable : Codable {
    func serialize() -> String?
    init?(jsonString:String)
}

extension Serializable {
    
    func serialize() -> String? {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(self), let result = String(data: data, encoding: .utf8) else { return nil }
        return result
    }
    
    init?(jsonString:String) {
        let decoder = JSONDecoder()
        
        guard let data = jsonString.data(using: .utf8) else {
            return nil
        }
        
        guard let object = try? decoder.decode(Self.self, from: data) else {
            return nil
        }
        
        self = object
    }
    
}
