//
//  GitHubRepositoryDetailsView.swift
//  GitHubRating
//
//  Created by dede.exe on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

class GitHubRepositoryDetailsView: UIView {
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var authorLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var ratingLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initComponents()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initComponents()
        setup()
    }
    
    func initComponents() {
        addSubview(titleLabel)
        addSubview(authorLabel)
        addSubview(ratingLabel)
    }
    
    func setup() {
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 8).isActive = true

        authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 0).isActive = true
        authorLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 0).isActive = true

        ratingLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8).isActive = true
        ratingLabel.leftAnchor.constraint(equalTo: authorLabel.leftAnchor, constant: 0).isActive = true
        ratingLabel.rightAnchor.constraint(equalTo: authorLabel.rightAnchor, constant: 0).isActive = true
        ratingLabel.bottomAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: authorLabel.bottomAnchor, multiplier: 8)

    }
    
}
