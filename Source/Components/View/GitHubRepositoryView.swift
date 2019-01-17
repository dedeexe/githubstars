//
//  GitHubRepositoryView.swift
//  GitHubRating
//
//  Created by dede.exe on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

protocol GitHubRepositoryViewDelegate : class {
    func gitHubRepositoryView(_ component: GitHubRepositoryImageView, didRequestImageAt address: String)
}

class GitHubRepositoryView: UIView, GitHubRepositoryImageViewDelegate {
    
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
    
    var imageAddress : String? {
        didSet { photoView.update(image: imageAddress) }
    }
    
    private lazy var detailView : GitHubRepositoryDetailsView = {
        let view = GitHubRepositoryDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var photoView : GitHubRepositoryImageView = {
        let view = GitHubRepositoryImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    weak var delegate : GitHubRepositoryViewDelegate?
    
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
        addSubview(photoView)
        photoView.set(image: UIImage(named: "placeholder"))
        photoView.delegate = self
    }
    
    func buildConstraints() {
        photoView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        photoView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        photoView.rightAnchor.constraint(equalTo: detailView.leftAnchor, constant: 0).isActive = true
        photoView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: 0).isActive = true
        photoView.widthAnchor.constraint(equalToConstant: 100).isActive = true

        detailView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        detailView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        detailView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: 0).isActive = true
        
    }
    
    func gitHubRepositoryImageViewDelegate(_ component: GitHubRepositoryImageView, didRequestImageAt address: String) {
        delegate?.gitHubRepositoryView(component, didRequestImageAt: address)
    }
    
}
