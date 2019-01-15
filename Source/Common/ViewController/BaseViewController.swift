//
//  BaseViewController.swift
//  GitHubRating
//
//  Created by Fabricio Santos on 15/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

class BaseViewController<V:UIView> : UIViewController {
    
    var internalView : V
    
    init(using view:V) {
        internalView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = internalView
    }
    
}
