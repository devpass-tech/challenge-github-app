//
//  EmptyViewController.swift
//  GitHubApp
//
//  Created by Jonas Silva on 12/09/22.
//

import UIKit

final class EmptyView: UIView {
    
    struct EmptyViewConfiguration: Encodable{
        let text: String
    }
    
    
    private lazy var lbNoReposFound: UILabel = {
        let label = UILabel()
        label.text = "No repositories found"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lbSearchForUsers: UILabel = {
        let label = UILabel()
        label.text = "Search for users to see their public repositories here!"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .footnote)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        
        super.init(frame: .zero)
        
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with configuration: EmptyViewConfiguration) {
        lbNoReposFound.text = configuration.text 
    }
    
    
}


extension EmptyView {
    
    func setupViews() {
        self.backgroundColor = .white
        self.configureSubviews()
        self.configureConstraints()
    }
    
    func configureSubviews() {
        self.addSubview(self.lbNoReposFound)
        self.addSubview(self.lbSearchForUsers)
    }
    
    private func configureConstraints(){
        
        NSLayoutConstraint.activate([
            // Label No Reponse Found
            lbNoReposFound.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            lbNoReposFound.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            lbNoReposFound.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 10),
            
            // Label Search For users
            lbSearchForUsers.topAnchor.constraint(equalTo: lbNoReposFound.bottomAnchor, constant: 15),
            lbSearchForUsers.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lbSearchForUsers.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lbSearchForUsers.leadingAnchor.constraint(equalTo: self.leadingAnchor)
            
            
            
        ])
    }
}

