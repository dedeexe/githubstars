//
//  RepositoryTableView.swift
//  GitHubRating
//
//  Created by dede.exe on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

protocol RepositoriesTableViewEventDelegate : class {
    func repositoriesTableViewDidReachEndOfList(_ tableView:RepositoriesTableView)
    func repositoriesTableViewDidPullRefreshed(_ tableView:RepositoriesTableView)
    func repositoriesTableView(_ tableView:RepositoriesTableView, didRequestImageAt address:String, for component:GitHubRepositoryImageView)
}

class RepositoriesTableView : UITableView {
    
    weak var eventDelegate : RepositoriesTableViewEventDelegate?
    
    var repositories : [Repository] = [] {
        didSet { self.update() }
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        dataSource = self
        delegate = self
        
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = UITableView.automaticDimension
        separatorStyle = .none
        
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.refreshControl = refresher
        
        register(GitHubItemCellTableViewCell.self, forCellReuseIdentifier: GitHubItemCellTableViewCell.identifier)
    }
    
    private func update() {
        DispatchQueue.main.async { [weak self] in
            self?.reloadData()
            self?.refreshControl?.endRefreshing()
        }
    }
    
    @objc func refresh(refreshControl : UIRefreshControl) {
        eventDelegate?.repositoriesTableViewDidPullRefreshed(self)
    }
    
}

extension RepositoriesTableView : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: GitHubItemCellTableViewCell.identifier, for: indexPath) as? GitHubItemCellTableViewCell else {
            fatalError("No cell found: \(GitHubItemCellTableViewCell.identifier)")
        }
        
        cell.delegate = self
        cell.repository = repositories[indexPath.row]
        return cell
    }
    
}

extension RepositoriesTableView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let offset = 3
        if indexPath.row == repositories.count - offset {
            eventDelegate?.repositoriesTableViewDidReachEndOfList(self)
        }
    }
}

extension RepositoriesTableView : GitHubItemCellTableViewCellDelegate {
    func gitHubItemCellTableViewCell(_ cell: GitHubItemCellTableViewCell, didRequestImageAt address: String, for component: GitHubRepositoryImageView) {
        eventDelegate?.repositoriesTableView(self, didRequestImageAt: address, for: component)
    }
}
