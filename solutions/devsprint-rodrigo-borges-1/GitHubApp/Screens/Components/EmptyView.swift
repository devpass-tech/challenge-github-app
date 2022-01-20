//
//  EmptyViewController.swift
//  GitHubApp
//
//  Created by Tania Mara Alves Ferreira on 18/01/22.
//

import UIKit

final class EmptyView: UIView{
    
    private var titleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No repositories found"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.black
     
        
        return label
    }()
    
    private var subtitleLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Search for users to see their public repositories here!"
        label.numberOfLines = 0
        label.textColor = UIColor.darkGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        self.configureSubviews()
        self.configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (corder:) has not been implemented")
    }
    
    func configureSubviews() {
        
        self.backgroundColor = .white
        self.addSubview(self.titleLabel)
        self.addSubview(self.subtitleLabel)
    }
    
    func configureConstraints(){

        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo:
            self.centerXAnchor),
            self.titleLabel.centerYAnchor.constraint(equalTo:
            self.centerYAnchor),
            
            self.subtitleLabel.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor, constant: 40),
            self.subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
        ])
        
    }
    
}
