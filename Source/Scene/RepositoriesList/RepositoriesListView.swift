//
//  RepositoryView.swift
//  GitHubRating
//
//  Created by Fabricio Santos on 15/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

protocol RepositoriesListViewDelegate : class {
    func respositoriesViewDidRequestMoreItens(_ view:RepositoriesListView)
    func respositoriesViewDidRequestPullRefresh(_ view:RepositoriesListView)
    func respositoriesView(_ view:RepositoriesListView, didRequestImageAt address:String, for component:GitHubRepositoryImageView)
}

class RepositoriesListView: UIView {
    
    private lazy var tableView : RepositoriesTableView = {
        let view = RepositoriesTableView()
        view.eventDelegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    weak var delegate : RepositoriesListViewDelegate?
    
    func update(repositories:[Repository]) {
        tableView.repositories = repositories
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        build()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        build()
    }
    
    func build() {
        buildComponents()
        buildConstraints()
        setup()
    }
    
    func buildComponents() {
        addSubview(tableView)
    }
    
    func buildConstraints() {
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func setup() {
        backgroundColor = UIColor.white
    }
    
}

extension RepositoriesListView : RepositoriesTableViewEventDelegate {
    func repositoriesTableView(_ tableView: RepositoriesTableView, didRequestImageAt address: String, for component: GitHubRepositoryImageView) {
        delegate?.respositoriesView(self, didRequestImageAt: address, for: component)
    }
    
    func repositoriesTableViewDidPullRefreshed(_ tableView: RepositoriesTableView) {
        delegate?.respositoriesViewDidRequestPullRefresh(self)
    }
    
    func repositoriesTableViewDidReachEndOfList(_ tableView: RepositoriesTableView) {
        delegate?.respositoriesViewDidRequestMoreItens(self)
    }
}
