//
//  ListRepositoriesConfigurator.swift
//  DemoVIP
//
//  Created by Chetankumar Dobariya on 08.04.20.
//  Copyright © 2020 Chetankumar Dobariya. All rights reserved.
//

import Foundation

class ListRepositoriesConfigurator {
    
    var router: ListRepositoriesRouter!
    var interactor: ListRepositoriesInteractor!
    var presenter: ListRepositoriesPresenter!
    
    // MARK: Object lifecycle
    
    init() {
        self.router = ListRepositoriesRouter()
        self.interactor = ListRepositoriesInteractor()
        self.presenter = ListRepositoriesPresenter()
        self.interactor.output = self.presenter
    }
    
    // MARK: Configuration
    
    func configure(_ viewController: ListRepositoriesViewController) {
        self.presenter.output = viewController
        viewController.router = self.router
        viewController.output = self.interactor
    }
}
