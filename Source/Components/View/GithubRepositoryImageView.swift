//
//  GithubRepositoryImageView.swift
//  GitHubRating
//
//  Created by dede.exe on 17/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

protocol GitHubRepositoryImageViewDelegate : class {
    func gitHubRepositoryImageViewDelegate(_ component:GitHubRepositoryImageView, didRequestImageAt address:String)
}

class GitHubRepositoryImageView: UIView {
    
    var imageURL : String? = "" {
        didSet { update(image:imageURL) }
    }
    
    private lazy var imageView : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    weak var delegate : GitHubRepositoryImageViewDelegate? = nil
    
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
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        clipsToBounds = true
    }
    
    func buildConstraints() {
        
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, constant: 0).isActive = true        
    }
    
    func update(image:String?) {
        guard let imageAddress = image else {
            imageView.image = nil
            return
        }
        
        delegate?.gitHubRepositoryImageViewDelegate(self, didRequestImageAt: imageAddress)
    }
    
    func set(image:UIImage?) {
        DispatchQueue.main.async { [weak self] in
            self?.imageView.image = image
        }
    }
    
}
