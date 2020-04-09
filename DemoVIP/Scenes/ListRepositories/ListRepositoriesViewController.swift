//
//  ViewController.swift
//  DemoVIP
//
//  Created by Chetankumar Dobariya on 08.04.20.
//  Copyright © 2020 Chetankumar Dobariya. All rights reserved.
//

import UIKit
import Foundation


protocol ListRepositoriesViewControllerInput: class {
    func displayRepositories(_ viewModel: ListRepositories.FetchNewRepositories.ViewModel)
    func displayError(_ viewModel: ListRepositories.LoadingError.ViewModel)
}

class ListRepositoriesViewController: UIViewController, ListRepositoriesViewControllerInput {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var loadingIndicator: UIActivityIndicatorView!
       
    var configurator: ListRepositoriesConfigurator!
    var router: ListRepositoriesRouterInput!
    var output: ListRepositoriesInteractorInput!
    var repositories = [Repository]()
      
    // MARK: - Object lifecycle
       
    override func awakeFromNib() {
        super.awakeFromNib()
           
        // Setup VIP-Chain
        self.configurator = ListRepositoriesConfigurator()
        self.configurator.configure(self)
    }
       
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
       super.viewDidLoad()
       self.addSpinner()
       self.output.FetchNewRepositories()
       
       // Cell registration
       self.tableView.register(UINib(nibName: "RepositoryTableViewCell", bundle: nil),
                               forCellReuseIdentifier: "RepositoryTableViewCell")
       self.title = "Repositories"
       self.tableView.estimatedRowHeight = 300.0
       self.tableView.separatorColor = UIColor.gray
       self.tableView.delegate = self
       self.tableView.dataSource = self
    }

    // MARK: - Private functions
    
    private func addSpinner() {
        self.loadingIndicator.isHidden = false
        DispatchQueue.main.async {
            self.loadingIndicator.startAnimating()
        }
    }
   
    private func removeSpinner() {
        self.loadingIndicator.isHidden = true
        self.loadingIndicator.stopAnimating()
    }
   
    // MARK: - Display logic
       
    func displayRepositories(_ viewModel: ListRepositories.FetchNewRepositories.ViewModel) {
        self.removeSpinner()
        guard self.tableView != nil else { return }
        self.repositories = viewModel.repositories
        self.tableView.reloadData()
    }
       
    func displayError(_ viewModel: ListRepositories.LoadingError.ViewModel) {
        self.removeSpinner()
        var errorMessage = ""
       
        switch viewModel.error {
        case .noInternet:
            errorMessage = "The Internet connection appears to be offline"
        case .empty:
            errorMessage = "Repositories are not available"
        case .generalFailure(let error):
            errorMessage = "Update failed, \(error.localizedDescription)"
        }
       
       let alertController = UIAlertController(title: "Failed", message: errorMessage, preferredStyle: .alert)
       alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
       self.present(alertController, animated: true, completion: nil)
    }

}


extension ListRepositoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //navigate to next screen
        self.router.navigateToRepositoryDetail(self)
    }
}

extension ListRepositoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let repository = self.repositories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryTableViewCell") as! RepositoryTableViewCell

        if let owner =  repository.owner {
            let data = RepositoryTableViewCell.Data(
                       username: repository.name,
                       description: repository.description,
                       repositoryImageUrl: owner.avatarUrl,
                       userImageUrl: owner.avatarUrl)
            cell.render(data)
        }
        return cell
    }
    
}
