//
//  Icon.swift
//  GitHubRating
//
//  Created by dede.exe on 17/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import Foundation

enum SpecialChar {
    case star
}

extension SpecialChar {
    var icon : String {
        switch self {
        case .star: return "\u{2605}"
        }
    }
}
