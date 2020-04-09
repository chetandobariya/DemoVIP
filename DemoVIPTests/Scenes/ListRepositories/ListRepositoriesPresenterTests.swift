//
//  ListRepositoriesPresenterTests.swift
//  DemoVIPTests
//
//  Created by Chetankumar Dobariya on 08.04.20.
//  Copyright © 2020 Chetankumar Dobariya. All rights reserved.
//
@testable import DemoVIP
import XCTest

class ListRepositoriesPresenterTests: XCTestCase {

    // MARK: Subject under test

    var sut = ListRepositoriesPresenter()
    let output = ListRepositoriesPresenterOutputSpy()

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()

        sut.output = output
    }

    // MARK: Test doubles

    class ListRepositoriesPresenterOutputSpy: ListRepositoriesViewControllerInput {
        
        var displayRepositoriesViewModelCalled: ListRepositories.FetchNewRepositories.ViewModel?
        var displayErrorViewModelCalled: ListRepositories.LoadingError.ViewModel?

        func displayRepositories(_ viewModel: ListRepositories.FetchNewRepositories.ViewModel) {
            displayRepositoriesViewModelCalled = viewModel
        }
        
        func displayError(_ viewModel: ListRepositories.LoadingError.ViewModel) {
            displayErrorViewModelCalled = viewModel
        }
       
    }

    // MARK: Tests

    func testPresentReposShouldAskToDisplayRepositoriesViewModel() {
        // Given
        let repositories = [sampleRepository(), sampleRepository()]

        // When
        let response = ListRepositories.FetchNewRepositories.Response(repositories: repositories)
        sut.presentRepositories(response)
        
        let loadExpectation = expectation(description: "should load repository response")
        loadExpectation.isInverted = true
        
        waitForExpectations(timeout: 0.01) { (error) in
            XCTAssertNil(error)
        }

        // Then
        guard let viewModel = output.displayRepositoriesViewModelCalled else {
            XCTFail("should return repository viewModel")
            return
        }

        XCTAssertGreaterThan(viewModel.repositories.count, 0, "viewModel should contain repository list")
    }
    
    func testPresentErrorShouldAskToDisplayErrorViewModel() {
        // Given
        let error = ListRepositories.LoadingError.RepositoryLoadingError.noInternet
        
        // When
        let response = ListRepositories.LoadingError.Response(error: error)
        sut.presentLoadingError(response)
        
        let loadExpectation = expectation(description: "should present error response")
        loadExpectation.isInverted = true
        
        waitForExpectations(timeout: 0.01) { (error) in
            XCTAssertNil(error)
        }

        // Then
        guard let viewModel = output.displayErrorViewModelCalled else {
            XCTFail("should return error viewModel")
            return
        }

        XCTAssertNotNil(viewModel.error, "viewModel should contain error message")
    }

}
