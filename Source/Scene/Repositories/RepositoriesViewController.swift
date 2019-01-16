//
//  RepositoriesViewController.swift
//  GitHubRating
//
//  Created by Fabricio Santos on 15/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

class RepositoriesViewController : BaseViewController<RepositoryView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        internalView.update(repositories: StubRep().createRepositories(quantity: 10))
    }
    
}


class StubRep {
    
    func createRandomRepository() -> Repository {
        let value = arc4random_uniform(UInt32.max)
        
        var o = Owner()
        o.id = Int(value)
        o.login = "Owner \(value)"
        
        var r = Repository()
        r.name = "Repository \(value)"
        r.owner = o
        
        return r
    }
    
    func createRepositories(quantity:Int) -> [Repository] {
        let reps = (0..<quantity).map { _ in createRandomRepository() }
        return reps
    }
    
}
