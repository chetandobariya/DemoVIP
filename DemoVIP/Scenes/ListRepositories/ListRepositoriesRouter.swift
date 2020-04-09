//
//  ListRepositoriesRouter.swift
//  DemoVIP
//
//  Created by Chetankumar Dobariya on 08.04.20.
//  Copyright © 2020 Chetankumar Dobariya. All rights reserved.
//

import UIKit

protocol ListRepositoriesRouterInput {
    func navigateToRepositoryDetail(_ viewController: UIViewController)
}

class ListRepositoriesRouter: ListRepositoriesRouterInput {
    
    // MARK: - Navigation
    func navigateToRepositoryDetail(_ viewController: UIViewController) {
        print("Repos tapped")
    }
}
