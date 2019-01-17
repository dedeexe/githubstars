//
//  GithubRepositoriesService.swift
//  GitHubRating
//
//  Created by Fabricio Santos on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import Foundation

class GithubRepositoriesService : NSObject, ServiceGettable {
    
    private var totalCount      = 0
    private var totalSearched   = 0
    private var page            = 1
    private let baseURL         = AppConfig.endpoint + "search/repositories?q=language:swift&sort=stars&per_page=50"
    private(set) var session    : URLSession?
    
    override init() {
        super.init()
        session = URLSession(configuration: .default)
    }
    
    func get(completion: ((RequestResult<[Repository]>) -> Void)?) {
        
        guard let request = createRequest() else {
            let error = NSError(domain: "Fail to create request", code: 600, userInfo: nil)
            let result = RequestResult<[Repository]>.fail(error)
            completion?(result)
            return
        }
        
        page += 1
        
        session?.dataTask(with: request) { [weak self] (data, response, error) in
            
            if let err = error {
                completion?(RequestResult<[Repository]>.fail(err))
                return
            }
            
            guard let data = data, let string = String(data: data, encoding: .utf8), let httpResponse = response as? HTTPURLResponse else {
                let err = NSError(domain: "Fail to convert data", code: 600, userInfo: nil)
                completion?(RequestResult<[Repository]>.fail(err))
                return
            }
            
            guard case 200..<300 = httpResponse.statusCode else {
                let err = NSError(domain: "", code: httpResponse.statusCode, userInfo: ["message": string])
                completion?(RequestResult<[Repository]>.fail(err))
                return
            }
            
            guard let result = RepositoriesSearch(jsonString: string) else {
                let err = NSError(domain: "Fail to parse json to object", code: 600, userInfo: nil)
                completion?(RequestResult<[Repository]>.fail(err))
                return
            }
            
            let items = result.items ?? []
            self?.totalSearched = (self?.totalSearched ?? 0) + items.count
            self?.totalCount = result.total_count ?? 0
            let response = RequestResult<[Repository]>.success(items)
            completion?(response)
            
        }.resume()
        
    }
    
    private func createRequest() -> URLRequest? {
        let urlString = baseURL + "&page=\(page)"
        guard let url = URL(string: urlString) else { return nil }
        
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        urlRequest.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        return urlRequest
    }
}
