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
        label.style.title()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var authorLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.style.subtitle()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var descriptionLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.style.description()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var ratingLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.style.description()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        addSubview(titleLabel)
        addSubview(authorLabel)
        addSubview(descriptionLabel)
        addSubview(ratingLabel)
    }
    
    func buildConstraints() {
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true

        authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 0).isActive = true
        authorLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 0).isActive = true

        descriptionLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: authorLabel.leftAnchor, constant: 0).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: authorLabel.rightAnchor, constant: 0).isActive = true
        
        ratingLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8).isActive = true
        ratingLabel.leftAnchor.constraint(equalTo: descriptionLabel.leftAnchor, constant: 0).isActive = true
        ratingLabel.rightAnchor.constraint(equalTo: descriptionLabel.rightAnchor, constant: 0).isActive = true
        ratingLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true

    }
    
}
