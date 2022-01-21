//
//  RepositoryCellView.swift
//  GitHubApp
//
//  Created by Luiza on 19/01/22.
//

import UIKit

struct RepositoryCellViewConfiguration {
    var title: String
    var subtitle: String
}

final class RepositoryCellView: UITableViewCell {

    // MARK: Components
    
    private lazy var repositoryTitle: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        return label
    }()

    private lazy var repositoryOwner: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        
        return label
    }()
    
    // MARK: Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        accessoryType = .disclosureIndicator
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with configuration: RepositoryCellViewConfiguration){
        
        repositoryTitle.text = configuration.title
        repositoryOwner.text = configuration.subtitle
    }

}

    // MARK: Protocols

extension RepositoryCellView: ViewCodable {
    
    func buildHierarchy() {
        addSubview(repositoryTitle)
        addSubview(repositoryOwner)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            repositoryTitle.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            
            repositoryTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            repositoryOwner.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            repositoryOwner.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            repositoryOwner.topAnchor.constraint(equalTo: repositoryTitle.bottomAnchor, constant: 8)
        ])
    }
}
