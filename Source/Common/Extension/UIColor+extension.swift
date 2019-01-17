//
//  UIColor+extension.swift
//  GitHubRating
//
//  Created by dede.exe on 17/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(r:UInt8, g:UInt8, b:UInt8) {
        let red = CGFloat(r) / CGFloat(255.0)
        let green = CGFloat(g) / CGFloat(255.0)
        let blue = CGFloat(b) / CGFloat(255.0)
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    convenience init(literal color:UInt32) {
        let red = UInt8((color & 0xFF0000) >> 16)
        let green = UInt8((color & 0x00FF00) >> 8)
        let blue = UInt8((color & 0x0000FF))
        self.init(r: red, g: green, b: blue)
    }
    
}
