//
//  GitHubItemCellTableViewCell.swift
//  GitHubRating
//
//  Created by dede.exe on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

class GitHubItemCellTableViewCell: UITableViewCell, Identifiable {
    
    
    private lazy var repositoryView : GitHubRepositoryView = {
        let view = GitHubRepositoryView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initComponents()
        setup()
    }
    
    var repository : Repository? = nil {
        didSet { update(repository: repository) }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initComponents()
        setup()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        initComponents()
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func initComponents() {
        contentView.addSubview(repositoryView)
    }
    
    private func setup() {
        selectionStyle = .none
        
        repositoryView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        repositoryView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        repositoryView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        repositoryView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    private func update(repository : Repository?) {
        repositoryView.title = repository?.name
        repositoryView.author = repository?.owner?.login
        repositoryView.update()
    }

}
