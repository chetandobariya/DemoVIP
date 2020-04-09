//
//  RepositoryWorkerMock.swift
//  DemoVIPTests
//
//  Created by Chetankumar Dobariya on 08.04.20.
//  Copyright © 2020 Chetankumar Dobariya. All rights reserved.
//


@testable import DemoVIP
import Foundation

class RepositoryWorkerMock: RepositoryWorkerInterface {
    var fetchCalled = false

    func fetchNewRepositories(completion: @escaping (ContentLoadingResult) -> Void){
        fetchCalled = true
        let decoder = JSONDecoder()
        let repoList = try! decoder.decode(Array<Repository>.self, from: getRepositoryDictionary())
        completion(.success(data: repoList))
    }
}
