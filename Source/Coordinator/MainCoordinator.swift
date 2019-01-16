//
//  MainCoordinator.swift
//  GitHubRating
//
//  Created by Fabricio Santos on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

class MainCoordinator : Coordinator {
    
    var childs: [Coordinator] = []
    var navigationController: UINavigationController?
    
    init(window:UIWindow?) {
        self.navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func start() {
        let coordinator = RepositoriesCoordinator(navigationController: self.navigationController)
        childs.append(coordinator)
        coordinator.start()
    }
}
