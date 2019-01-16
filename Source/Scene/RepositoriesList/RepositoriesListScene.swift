//
//  RepositoryScene.swift
//  GitHubRating
//
//  Created by Fabricio Santos on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

class RepositoriesListScene {
    
    static func create() -> RepositoriesListViewController {
        let view = RepositoriesListView()
        let service = GithubRepositoriesService()
        let controller = RepositoriesListViewController(using: view, service: service)
        return controller
    }
    
    static func createInNavigation() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: create())
        return navigation
    }
    
}
