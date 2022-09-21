//
//  RepositoryViewCell.swift
//  GitHubApp
//
//  Created by Victor Santos on 9/15/22.
//

import UIKit

class RepositoryViewCell: UITableViewCell {
    
    struct RepositoryViewCellConfiguration: Encodable {
        
        var repoName: String
        var ownerName: String
    }

    lazy var repoNameLabel: UILabel = {
        let repoNameLabel = UILabel()
        repoNameLabel.translatesAutoresizingMaskIntoConstraints = false
        repoNameLabel.text = ""
        repoNameLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        return repoNameLabel
    }()

    lazy var ownerNameLabel: UILabel = {
        let ownerNameLabel = UILabel()
        ownerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        ownerNameLabel.text = ""
        ownerNameLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        ownerNameLabel.textColor = .secondaryLabel
        
        return ownerNameLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constraintUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constraintUI() {
        
        addSubview(repoNameLabel)
        addSubview(ownerNameLabel)
        accessoryType = .disclosureIndicator
        
        
        NSLayoutConstraint.activate([
            repoNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            repoNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            repoNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            ownerNameLabel.topAnchor.constraint(equalTo: repoNameLabel.bottomAnchor, constant: 8),
            ownerNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            ownerNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            ownerNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
        
    }
    
    func updateView(with configuration: RepositoryViewCellConfiguration) {
        
        repoNameLabel.text = configuration.repoName
        ownerNameLabel.text = configuration.ownerName
        
    }

}
