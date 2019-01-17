//
//  RepositoriesCoordinator.swift
//  GitHubRating
//
//  Created by Fabricio Santos on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

class RepositoriesCoordinator : BaseCoordinator<RepositoriesListViewController> {
    
    init(navigationController : UINavigationController?) {
        let viewController = RepositoriesListScene.create()
        super.init(navigationController: navigationController, viewController: viewController)
    }
    
    override func start() {
        viewController.title = "Repositories"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
