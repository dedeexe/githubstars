//
//  BaseCoordinator.swift
//  GitHubRating
//
//  Created by Fabricio Santos on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

class BaseCoordinator<VC:UIViewController> : Coordinator {
    
    var childs: [Coordinator] = []
    var navigationController: UINavigationController?
    var viewController : VC
    
    init(navigationController : UINavigationController?, viewController:VC) {
        self.viewController = viewController
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
}
