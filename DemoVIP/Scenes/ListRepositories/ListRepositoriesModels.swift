//
//  ListRepositoriesModels.swift
//  DemoVIP
//
//  Created by Chetankumar Dobariya on 08.04.20.
//  Copyright © 2020 Chetankumar Dobariya. All rights reserved.
//

import Foundation

struct ListRepositories {
   
    struct FetchNewRepositories {
        
        struct Request { }
        
        struct Response {
            let repositories: [Repository]
        }
        
        struct ViewModel {
            let repositories: [Repository]
        }
        
    }
    
    struct LoadingError {
       
        enum RepositoryLoadingError {
            case noInternet, generalFailure(Error), empty
        }
        
        struct Request { }
        
        struct Response {
            let error: RepositoryLoadingError
        }
        
        struct ViewModel {
            let error: RepositoryLoadingError
        }
    }
   
}

