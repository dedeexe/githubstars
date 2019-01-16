//
//  Coordinator.swift
//  GitHubRating
//
//  Created by Fabricio Santos on 16/01/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

protocol Coordinator : class {
    var childs : [Coordinator] { get set }
    var navigationController : UINavigationController? { get set }
    
    func start()
}
