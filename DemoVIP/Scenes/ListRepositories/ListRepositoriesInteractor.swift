//
//  ListRepositoriesInteractor.swift
//  DemoVIP
//
//  Created by Chetankumar Dobariya on 08.04.20.
//  Copyright © 2020 Chetankumar Dobariya. All rights reserved.
//

import Alamofire

protocol ListRepositoriesInteractorInput {
    func FetchNewRepositories()
}

class ListRepositoriesInteractor: ListRepositoriesInteractorInput {

    var output: ListRepositoriesPresenterInput!
    var repositoryWorker = RepositoryWorker.shared
    let networkReachabilityManager = NetworkReachabilityManager()
   
    func FetchNewRepositories() {
        guard networkReachabilityManager?.isReachable ?? false else {
            self.output.presentLoadingError(ListRepositories.LoadingError.Response(error: .noInternet))
            return
        }

        repositoryWorker.fetchNewRepositories(completion: { [weak self] result in
            switch(result) {
            case .success(let repositories):
                self?.output.presentRepositories(ListRepositories.FetchNewRepositories.Response( repositories: repositories))
            case .generalError(let error):
                self?.output.presentLoadingError(ListRepositories.LoadingError.Response(error: .generalFailure(error)))
            case .empty:
                self?.output.presentLoadingError(ListRepositories.LoadingError.Response(error: .empty))
            }
        })
    }
    
}
