//
//  RepositoriesViewController.swift
//  GitHubRating
//
//  Created by Fabricio Santos on 15/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

protocol RepositoriesViewControllerDelegate : class {
    func requestNewRepositories()
}

class RepositoriesViewController : BaseViewController<RepositoriesView> {
    
    weak var delegate : RepositoriesViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        internalView.update(repositories: StubRep().createRepositories(quantity: 10))
    }
    
    func setup() {
        title = "Repositories"
    }
    
}

class StubRep {
    
    func createRandomRepository() -> Repository {
        let value = arc4random_uniform(UInt32.max)
        let stars = Int(arc4random_uniform(UInt32(UInt16.max)))
        let cycle = Int(arc4random_uniform(30))
        
        var o = Owner()
        o.id = Int(value)
        o.login = "Owner \(value)"
        
        var r = Repository()
        r.name = "Repository \(value)"
        r.owner = o
        r.stargazers_count = stars
        r.description = String(repeating: "enjwk qe erewq ", count: cycle)
        
        return r
    }
    
    func createRepositories(quantity:Int) -> [Repository] {
        let reps = (0..<quantity).map { _ in createRandomRepository() }
        return reps
    }
    
}
