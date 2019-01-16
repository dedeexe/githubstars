//
//  RepositoryView.swift
//  GitHubRating
//
//  Created by Fabricio Santos on 15/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

protocol RepositoriesViewDelegate {
    func respositoriesViewDidRequestMoreItens(_ view:RepositoriesView)
}

class RepositoriesView: UIView {
    
    private lazy var tableView : RepositoriesTableView = {
        let view = RepositoriesTableView()
        view.eventDelegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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

extension RepositoriesView : RepositoriesTableViewEventDelegate {
    func repositoriesTableViewDidReachEndOfList(_ tableView: RepositoriesTableView) {
        print("Reach the end")
    }
}
