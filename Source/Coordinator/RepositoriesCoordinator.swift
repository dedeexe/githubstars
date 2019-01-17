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
        let view = RepositoriesListView()
        let service = GithubRepositoriesService()
        let downloader = DownloadImageService()
        let controller = RepositoriesListViewController(using: view, githubService: service, imageService: downloader)
        super.init(navigationController: navigationController, viewController: controller)
    }
    
    override func start() {
        viewController.title = "Repositories"
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
