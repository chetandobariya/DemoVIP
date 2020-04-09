//
//  RepositoryWorker.swift
//  DemoVIP
//
//  Created by Chetankumar Dobariya on 08.04.20.
//  Copyright © 2020 Chetankumar Dobariya. All rights reserved.
//


import Foundation
import Alamofire


enum ContentLoadingResult {
    case success(data: [Repository]), empty, generalError(error: Error)
}

protocol RepositoryWorkerInterface {
    /// fetch new repositories from backend
    /// - Returns: result of api call with data or error
    func fetchNewRepositories(completion: @escaping (ContentLoadingResult) -> Void)
}

class RepositoryWorker: RepositoryWorkerInterface {
    
    static var shared: RepositoryWorkerInterface =  RepositoryWorker()

    func fetchNewRepositories(completion: @escaping (ContentLoadingResult) -> Void) {
        let url = "https://api.github.com/repositories"
        AF.request(url)
        .validate()
        .responseDecodable(of: Array<Repository>.self) { response in
         
         if let error = response.error {
            completion(.generalError(error: error))
            return
         }
            
         guard let data = response.value else {
             completion(.empty)
             return
         }
         completion(.success(data: data))
        }

    }
      
}
