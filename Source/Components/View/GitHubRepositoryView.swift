//
//  GitHubRepositoryView.swift
//  GitHubRating
//
//  Created by dede.exe on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

class GitHubRepositoryView: UIView {
    
    var title : String = "" {
        didSet { detailView.titleLabel.text = title }
    }
    
    var author : String = "" {
        didSet { detailView.authorLabel.text = author }
    }
    
    var stars : Int = 0 {
        didSet { detailView.ratingLabel.text = String(stars) }
    }
    
    var descriptionText : String = "" {
        didSet { detailView.descriptionLabel.text = descriptionText }
    }
    
    
    private lazy var detailView : GitHubRepositoryDetailsView = {
        let view = GitHubRepositoryDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        build()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        build()
    }
    
    func build() {
        buildComponents()
        buildConstraints()
    }
    
    func buildComponents() {
        addSubview(detailView)
    }
    
    func buildConstraints() {
        detailView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        detailView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        detailView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        detailView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
}
