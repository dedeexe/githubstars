//
//  RepositoriesViewController.swift
//  GitHubRating
//
//  Created by Fabricio Santos on 15/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

protocol RepositoriesViewControllerDelegate : class {
    func requestNewRepositories()
}

class RepositoriesListViewController : BaseViewController<RepositoriesListView> {
    
    weak var delegate : RepositoriesViewControllerDelegate?
    private let service : GithubRepositoriesService
    
    private var repositories : [Repository] = []
    
    init(using view: RepositoriesListView, service:GithubRepositoriesService) {
        self.service = service
        super.init(using: view)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRepositories()
    }
    
    func show(repositories:[Repository]) {
        self.repositories.append(contentsOf: repositories)
        internalView.update(repositories: repositories)
    }
    
    func getRepositories() {
        service.get { [weak self] (result) in
            switch result {
            case .success(let repositories):
                self?.repositories.append(contentsOf: repositories)
                self?.internalView.update(repositories: self?.repositories ?? [])
            default:
                break
            }
        }
    }
    
}
