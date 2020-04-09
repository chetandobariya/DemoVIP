//
//  RepositoriesTableViewCell.swift
//  DemoVIP
//
//  Created by Chetankumar Dobariya on 08.04.20.
//  Copyright © 2020 Chetankumar Dobariya. All rights reserved.
//


import UIKit
import AlamofireImage

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet private weak var repositoryImageView: UIImageView!
    @IBOutlet private weak var repositoryDescriptionTextView: UITextView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var userImageView: UIImageView!
    
    struct Data {
        let username: String
        let description: String
        let repositoryImageUrl: String
        let userImageUrl: String
    }
    
    typealias PropTypes = Data
    
    override func awakeFromNib() {
        // Initialization code
        super.awakeFromNib()
        self.userImageView.layer.cornerRadius = self.userImageView.frame.size.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func render(_ propTypes: PropTypes) {
        self.nameLabel.text = propTypes.username
        self.repositoryDescriptionTextView.text = propTypes.description
        self.setRepositoryImage(urlString: propTypes.repositoryImageUrl)
        self.setUserImage(urlString: propTypes.userImageUrl)
    }

    private func setRepositoryImage(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        repositoryImageView.af.setImage(withURL: url)
        //we can cache image using own cache mechanism - uncomment below line
        //self.repositoryImageView.loadImage(with: url)
    }
    
    private func setUserImage(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        userImageView.af.setImage(withURL: url)
    }
}

