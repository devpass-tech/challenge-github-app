//
//  RepositoryCellView.swift
//  GitHubApp
//
//  Created by Marcelo Araujo on 20/01/23.
//

import UIKit

struct RepositoryCellViewConfiguration {
    
    let repoName: String
    let repoOwner: String
    
}

class RepositoryCellView: UITableViewCell {
    
    static let identifier = "RepoCell"
    
    lazy private var repositoryName: UILabel = {
        let labelRepo = UILabel()
        labelRepo.text = "teste"
        labelRepo.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        labelRepo.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        labelRepo.translatesAutoresizingMaskIntoConstraints = false
        return labelRepo
    }()
    
    lazy private var ownerName: UILabel = {
        let ownerName = UILabel()
        ownerName.text = "teste 2"
        ownerName.textColor = .gray
        ownerName.font = UIFont.systemFont(ofSize: 13, weight: .light)
        ownerName.translatesAutoresizingMaskIntoConstraints = false
        return ownerName
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .yellow
        addSubViews()
        constraintsSubView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addSubViews(){
        contentView.addSubview(repositoryName)
        contentView.addSubview(ownerName)
        
    }
    
    private func constraintsSubView(){
        setUpConstraintsRepositoryName()
        setUpConstraintsOwnerName()
    }
    
    private func setUpConstraintsRepositoryName(){
        NSLayoutConstraint.activate([
            repositoryName.topAnchor.constraint(equalTo: topAnchor,constant: 5),
            repositoryName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        ])
    }
    
    private func setUpConstraintsOwnerName(){
        NSLayoutConstraint.activate([
            ownerName.topAnchor.constraint(equalTo: repositoryName.bottomAnchor, constant: 5 ),
            ownerName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
    
    public func updateView(with configuration: RepositoryCellViewConfiguration){
        repositoryName.text = configuration.repoName
        ownerName.text = configuration.repoOwner
    }
    
}
