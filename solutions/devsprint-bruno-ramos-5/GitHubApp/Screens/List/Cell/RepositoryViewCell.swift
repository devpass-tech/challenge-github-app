//
//  RepositoryViewCell.swift
//  GitHubApp
//
//  Created by Felipe on 06/07/22.
//

import UIKit

final class RepositoryViewCell: UITableViewCell {
    
    struct RepositoryViewCellConfiguration{
        let repositoryName: String
        let repsitoryOwnerName: String
    }
    
    private lazy var containerVS: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 6
        
        return stack
    }()
    
    private lazy var repositoryNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        
        return label
    }()
    
    private lazy var repositoryOwnerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
        setup()
        
        
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        return nil
    }
    
    
}
extension RepositoryViewCell: ViewCode{
    func setupExtraConfiguration() {}
    
    func setupSubviews() {
        self.addSubview(containerVS)
        containerVS.addArrangedSubview(repositoryNameLabel)
        containerVS.addArrangedSubview(repositoryOwnerNameLabel)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            containerVS.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            containerVS.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            containerVS.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            containerVS.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
        ])
    }
    

    
    func updateCell(configuration: RepositoryViewCellConfiguration) {
        repositoryNameLabel.text = configuration.repositoryName
        repositoryOwnerNameLabel.text = configuration.repsitoryOwnerName
    }
    
}
