//  RepositoryCellView.swift
//  GitHubApp
//
//  Created by GISELE TOLEDO on 04/04/23.
//

import UIKit

struct RepositoryCellViewConfiguration {
    let repositoryName: String
    let userName: String
}

class RepositoryCellView: UITableViewCell {
    
    private let repositoryNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        addSubview(repositoryNameLabel)
        addSubview(userNameLabel)
        
        NSLayoutConstraint.activate([
            repositoryNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            repositoryNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            repositoryNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            userNameLabel.leadingAnchor.constraint(equalTo: repositoryNameLabel.leadingAnchor),
            userNameLabel.topAnchor.constraint(equalTo: repositoryNameLabel.bottomAnchor, constant: 4),
            userNameLabel.trailingAnchor.constraint(equalTo: repositoryNameLabel.trailingAnchor),
            userNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    func updateView(with configuration: RepositoryCellViewConfiguration) {
        repositoryNameLabel.text = configuration.repositoryName
        userNameLabel.text = configuration.userName
    }
    
}
