//
//  RepositoryTableView.swift
//  GitHubRating
//
//  Created by dede.exe on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

class RepositoryTableView : UITableView {
    
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
        register(GitHubItemCellTableViewCell.self, forCellReuseIdentifier: GitHubItemCellTableViewCell.identifier)
    }
    
    private func update() {
        DispatchQueue.main.async { [weak self] in
            self?.reloadData()
        }
    }
    
}

extension RepositoryTableView : UITableViewDataSource {
    
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
        
        cell.repository = repositories[indexPath.row]
        return cell
    }
    
}

extension RepositoryTableView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
