//
//  ListRepositoriesInteractorTests.swift
//  DemoVIPTests
//
//  Created by Chetankumar Dobariya on 08.04.20.
//  Copyright © 2020 Chetankumar Dobariya. All rights reserved.
//

@testable import DemoVIP
import XCTest

class ListRepositoriesInteractorTests: XCTestCase {
  
    // MARK: Subject under test
    
    var sut = ListRepositoriesInteractor()
    var outputSpy = ListRepositoriesInteractorOutputSpy()
    var repositoryWorkerMock = RepositoryWorkerMock()
  
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        sut.output = outputSpy
        sut.repositoryWorker = repositoryWorkerMock
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test doubles
    
    class ListRepositoriesInteractorOutputSpy: ListRepositoriesPresenterInput {
    
        var presentLoadingErrorCalled: ListRepositories.LoadingError.Response?
        var presentRepositoriesResponseCalled: ListRepositories.FetchNewRepositories.Response?
        
        func presentLoadingError(_ response: ListRepositories.LoadingError.Response) {
            presentLoadingErrorCalled = response
        }
        
        func presentRepositories(_ response: ListRepositories.FetchNewRepositories.Response) {
            presentRepositoriesResponseCalled = response
        }
        
    }
    
    // MARK: Tests
    
    func testFetchReposShouldPresentRepositoriesUpdate() {
        // Given
        let repository = sampleRepository()
        
        // When
        sut.FetchNewRepositories()
        
        let loadExpectation = expectation(description: "should load response")
        loadExpectation.isInverted = true

        waitForExpectations(timeout: 0.01) { (error) in
            XCTAssertNil(error)
            loadExpectation.fulfill()
        }
        
        // Then
        XCTAssertTrue(repositoryWorkerMock.fetchCalled, "should ask worker to fetch")
        guard let response = outputSpy.presentRepositoriesResponseCalled else {
            XCTFail("should respond")
            return
        }
        XCTAssertTrue(response.repositories.contains { $0.id == repository.id }, "should load repositories")

    }
    
}
