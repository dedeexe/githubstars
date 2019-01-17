//
//  RepositoriesSearch.swift
//  GitHubRating
//
//  Created by dede.exe on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import Foundation

struct RepositoriesSearch : Serializable {
    var total_count : Int?
    var items : [Repository]?
}
