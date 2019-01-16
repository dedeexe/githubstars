//
//  RepositoryView.swift
//  GitHubRating
//
//  Created by Fabricio Santos on 15/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

protocol RepositoryViewDelegate {
    func respositoryViewDidRequestMoreItens(_ view:RepositoryView)
}

class RepositoryView: UIView {

    private lazy var tableView : RepositoryTableView = {
        let view = RepositoryTableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func update(repositories:[Repository]) {
        tableView.repositories = repositories
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        initComponents()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initComponents()
        setup()
    }
    
    private func initComponents() {
        addSubview(tableView)
    }
    
    private func setup() {
        backgroundColor = UIColor.white
        
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
}
