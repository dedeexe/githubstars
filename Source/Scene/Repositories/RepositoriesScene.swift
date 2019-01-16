//
//  RepositoryScene.swift
//  GitHubRating
//
//  Created by Fabricio Santos on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

class RepositoriesScene {
    
    static func create() -> RepositoriesViewController {
        let view = RepositoriesView()
        let controller = RepositoriesViewController(using: view)
        return controller
    }
    
    static func createInNavigation() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: create())
        return navigation
    }
    
}
