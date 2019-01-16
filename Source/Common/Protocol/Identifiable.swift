//
//  Identifiable.swift
//  GitHubRating
//
//  Created by dede.exe on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import Foundation

protocol Identifiable {
    static var identifier : String { get }
}

extension Identifiable {
    static var identifier : String {
        return String(describing: self)
    }
}
