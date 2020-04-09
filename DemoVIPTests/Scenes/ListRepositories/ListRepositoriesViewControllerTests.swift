//
//  ListRepositoriesViewControllerTests.swift
//  DemoVIPTests
//
//  Created by Chetankumar Dobariya on 08.04.20.
//  Copyright © 2020 Chetankumar Dobariya. All rights reserved.
//

@testable import DemoVIP
import XCTest

class ListRepositoriesViewControllerTests: XCTestCase {

    // MARK: Subject under test

    var sut: ListRepositoriesViewController!
    var outputSpy = ListRepositoriesViewControllerOutputSpy()
    var window: UIWindow!
    let presenter = ListRepositoriesPresenterMock()
    let router = ListRepositoriesRouterMock()

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        setupListRepositoriesViewController()
    }

    // MARK: Test setup

    func setupListRepositoriesViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "ListRepositories", bundle: bundle)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        sut = navigationController.topViewController as? ListRepositoriesViewController
        sut.awakeFromNib()
        
        sut.output = outputSpy
        presenter.output = sut
        outputSpy.output = presenter
        sut.router = router

        let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        keyWindow!.rootViewController = sut

        XCTAssertNotNil(sut.view)
    }

    // MARK: Test doubles

    class ListRepositoriesRouterMock: ListRepositoriesRouterInput {
        var didCallNavigateToRepositoryDetail = false
        
        func navigateToRepositoryDetail(_ viewController: UIViewController) {
            didCallNavigateToRepositoryDetail = true
        }
       
    }

    class ListRepositoriesPresenterMock: ListRepositoriesPresenterInput {
        var output: ListRepositoriesViewControllerInput?

        func presentLoadingError(_ response: ListRepositories.LoadingError.Response) {
            let viewModel = ListRepositories.LoadingError.ViewModel(error: response.error)
            output?.displayError(viewModel)
        }
        
        func presentRepositories(_ response: ListRepositories.FetchNewRepositories.Response) {
            let viewModel = ListRepositories.FetchNewRepositories.ViewModel(repositories: response.repositories)
            output?.displayRepositories(viewModel)
        }
    }

    class ListRepositoriesViewControllerOutputSpy: ListRepositoriesInteractorInput {
        var output: ListRepositoriesPresenterMock?
        var fetchRepositoriesRequestCalled =  false
        let repositories = [sampleRepository(), sampleRepository()]

        func FetchNewRepositories() {
            fetchRepositoriesRequestCalled = true
            let response  = ListRepositories.FetchNewRepositories.Response(repositories: repositories)
            output?.presentRepositories(response)
        }
    }

    // MARK: Tests

    func testShouldFetchRepositoryListOnLoad() {
        //Given
        sut.viewDidLoad()

        //When
        let loadExpectation = expectation(description: "should load repositories")
        loadExpectation.isInverted = true

        waitForExpectations(timeout: 0.01) { (error) in
            XCTAssertNil(error)
            loadExpectation.fulfill()
        }

        //Then
        XCTAssertTrue(self.outputSpy.fetchRepositoriesRequestCalled, "should request repositories list from output")
    }
}

