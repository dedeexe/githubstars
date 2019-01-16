//
//  GithubRepositoriesService.swift
//  GitHubRating
//
//  Created by Fabricio Santos on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import Foundation

class GithubRepositoriesService : ServiceGettable {
    
    let url = AppConfig.endpoint + "/search/repositories/"
    
    func get(completion: ((RequestResult<[Repository]>) -> Void)?) {
        let result = RequestResult<[Repository]>.success(StubRep().createRepositories(quantity: 30))
        completion?(result)
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
