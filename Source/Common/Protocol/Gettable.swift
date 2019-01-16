//
//  Gettable.swift
//  GitHubRating
//
//  Created by Fabricio Santos on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import Foundation

protocol ServiceGettable {
    
    associatedtype GettableResult
    func get(completion:((GettableResult) -> Void)?)
    
}
