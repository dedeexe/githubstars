//
//  UILabel+Style.swift
//  GitHubRating
//
//  Created by dede.exe on 17/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

extension UILabel {
    
    struct Style {
        unowned let component : UILabel
        
        init(component: UILabel) {
            self.component = component
        }
        
        func title() {
            component.font = FontStyle.title
            component.textColor = ColorPallete.Font.title
        }
        
        func subtitle() {
            component.font = FontStyle.subtitle
            component.textColor = ColorPallete.Font.subtitle
        }
        
        func description() {
            component.font = FontStyle.description
            component.textColor = ColorPallete.Font.description
        }
    }
    
    var style : Style {
        return Style(component: self)
    }
    
}
