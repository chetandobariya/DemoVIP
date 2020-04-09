//
//  ListRepositoriesPresenter.swift
//  DemoVIP
//
//  Created by Chetankumar Dobariya on 08.04.20.
//  Copyright © 2020 Chetankumar Dobariya. All rights reserved.
//

import Foundation

protocol ListRepositoriesPresenterInput {
    func presentRepositories(_ response: ListRepositories.FetchNewRepositories.Response)
    func presentLoadingError(_ response: ListRepositories.LoadingError.Response)
}

class ListRepositoriesPresenter: ListRepositoriesPresenterInput {
    
     weak var output: ListRepositoriesViewControllerInput?

     func presentRepositories(_ response: ListRepositories.FetchNewRepositories.Response) {
          //Make sure result will be rendered on main thread
          DispatchQueue.main.async { [weak self] in
            let viewModel = ListRepositories.FetchNewRepositories.ViewModel(repositories: response.repositories)
            self?.output?.displayRepositories(viewModel)
          }
      }
      
      func presentLoadingError(_ response: ListRepositories.LoadingError.Response) {
          DispatchQueue.main.async { [weak self] in
            let viewModel =  ListRepositories.LoadingError.ViewModel(error: response.error)
            self?.output?.displayError(viewModel)
          }
      }
    
}
