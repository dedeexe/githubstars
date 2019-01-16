//
//  RepositoriesCoordinator.swift
//  GitHubRating
//
//  Created by Fabricio Santos on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

class RepositoriesCoordinator : BaseCoordinator<RepositoriesViewController> {
    
    init(navigationController : UINavigationController?) {
        let viewController = RepositoriesScene.create()
        super.init(navigationController: navigationController, viewController: viewController)
        viewController.delegate = self
    }
    
    override func start() {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension RepositoriesCoordinator : RepositoriesViewControllerDelegate {
    func requestNewRepositories() {
        
    }
}
