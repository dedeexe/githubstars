//
//  RepositoriesViewController.swift
//  GitHubRating
//
//  Created by Fabricio Santos on 15/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

class RepositoriesListViewController : BaseViewController<RepositoriesListView> {
    
    private let service : GithubRepositoriesService
    private let downloader : DownloadImageService
    
    private var isPullRefresh = false
    private var repositories : [Repository] = []
    
    init(using view: RepositoriesListView, githubService:GithubRepositoriesService, imageService:DownloadImageService) {
        self.service = githubService
        self.downloader = imageService
        super.init(using: view)
        view.delegate = self
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
    
    func removeRepositoriesIfNeeded() {
        if isPullRefresh {
            isPullRefresh = false
            self.repositories.removeAll()
        }
    }
    
    func getRepositories() {
        show(spinning: true)
        service.get { [weak self] (result) in
            switch result {
            case .success(let repositories):
                self?.removeRepositoriesIfNeeded()
                self?.repositories.append(contentsOf: repositories)
                self?.internalView.update(repositories: self?.repositories ?? [])
            default:
                break
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.show(spinning: false)
            }
        }
    }
    
    func show(spinning:Bool) {
        if !spinning {
            navigationItem.rightBarButtonItems = []
            return
        }
        
        let activity = UIActivityIndicatorView(style: .gray)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: activity)]
        activity.startAnimating()
    }
    
}

extension RepositoriesListViewController : RepositoriesListViewDelegate {
    func respositoriesView(_ view: RepositoriesListView, didRequestImageAt address: String, for component: GitHubRepositoryImageView) {
        downloader.get(imageUrl: address) { response in
            switch response {
            case .success(let image):
                component.set(image: image)
            default:
                component.set(image: UIImage(named:"placeholder"))
            }
        }
    }
    
    func respositoriesViewDidRequestPullRefresh(_ view: RepositoriesListView) {
        isPullRefresh = true
        service.reset()
        getRepositories()
    }
    
    func respositoriesViewDidRequestMoreItens(_ view: RepositoriesListView) {
        getRepositories()
    }
}
