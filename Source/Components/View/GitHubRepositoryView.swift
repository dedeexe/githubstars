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
        didSet {
            let text = SpecialChar.star.icon + " " + String(stars)
            detailView.ratingLabel.text = text
        }
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
    
    private lazy var containerView : UIView = {
        let view = UIView()
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
        addSubview(containerView)
        containerView.addSubview(detailView)
        containerView.addSubview(photoView)
        photoView.set(image: UIImage(named: "placeholder"))
        photoView.delegate = self
        
        containerView.backgroundColor = ColorPallete.Cell.background
        containerView.layer.cornerRadius = 8.0
        containerView.layer.masksToBounds = true
    }
    
    func buildConstraints() {
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
        photoView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
        photoView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16).isActive = true
        photoView.rightAnchor.constraint(equalTo: detailView.leftAnchor, constant: -8).isActive = true
        photoView.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -8).isActive = true
        photoView.widthAnchor.constraint(equalToConstant: 100).isActive = true

        detailView.topAnchor.constraint(equalTo: photoView.topAnchor, constant: 0).isActive = true
        detailView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16).isActive = true
        detailView.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -8).isActive = true
    }
    
    func gitHubRepositoryImageViewDelegate(_ component: GitHubRepositoryImageView, didRequestImageAt address: String) {
        delegate?.gitHubRepositoryView(component, didRequestImageAt: address)
    }
    
}
