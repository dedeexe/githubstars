//
//  GitHubItemCellTableViewCell.swift
//  GitHubRating
//
//  Created by dede.exe on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

protocol GitHubItemCellTableViewCellDelegate : class {
    func gitHubItemCellTableViewCell(_ cell:GitHubItemCellTableViewCell, didRequestImageAt address:String, for component:GitHubRepositoryImageView)
}

class GitHubItemCellTableViewCell: UITableViewCell, Identifiable {
    
    private lazy var repositoryView : GitHubRepositoryView = {
        let view = GitHubRepositoryView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        build()
    }
    
    var repository : Repository? = nil {
        didSet { update(repository: repository) }
    }
    
    weak var delegate : GitHubItemCellTableViewCellDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        build()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        build()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        repositoryView.title = ""
        repositoryView.author = ""
        repositoryView.stars = 0
        repositoryView.descriptionText = ""
        repositoryView.imageAddress = "placeholder"
    }
    
    func build() {
        buildComponents()
        buildConstraints()
    }
    
    func buildComponents() {
        contentView.addSubview(repositoryView)
        repositoryView.delegate = self
    }
    
    func buildConstraints() {
        selectionStyle = .none
        
        repositoryView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        repositoryView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        repositoryView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        repositoryView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    private func update(repository : Repository?) {
        repositoryView.title = repository?.name ?? ""
        repositoryView.author = repository?.owner?.login ?? ""
        repositoryView.stars = repository?.stargazers_count ?? 0
        repositoryView.descriptionText = repository?.description ?? ""
        repositoryView.imageAddress = repository?.owner?.avatar_url ?? ""
    }

}

extension GitHubItemCellTableViewCell: GitHubRepositoryViewDelegate {
    func gitHubRepositoryView(_ component: GitHubRepositoryImageView, didRequestImageAt address: String) {
        delegate?.gitHubItemCellTableViewCell(self, didRequestImageAt: address, for: component)
    }
}
