//
//  RequestResult.swift
//  GitHubRating
//
//  Created by Fabricio Santos on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import Foundation

enum RequestResult<T> {
    case success(T)
    case fail(Error)
}
