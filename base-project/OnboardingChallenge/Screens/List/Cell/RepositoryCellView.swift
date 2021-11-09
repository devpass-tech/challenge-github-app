//
//  RepositoryCellView.swift
//  OnboardingChallenge
//
//  Created by Gustavo Soares on 08/11/21.
//

import UIKit

struct RepositoryCellViewConfiguration {
    var repositoryName: String
    var repositoryOwnerName: String
}

class RepositoryCellView: UITableViewCell {
    
    private lazy var repositoryNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var repositoryOwnerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupView() {
        configureSubViews()
        configureSubviewsConstraints()
        configureAdditionalBehaviors()
    }
    
    func updateView(with configuration: RepositoryCellViewConfiguration) {
        repositoryNameLabel.text = configuration.repositoryName
        repositoryOwnerNameLabel.text = configuration.repositoryOwnerName
    }
    
}

private extension RepositoryCellView {
    
    func configureSubViews() {
        contentView.addSubview(repositoryNameLabel)
        contentView.addSubview(repositoryOwnerNameLabel)
    }
    
    func configureSubviewsConstraints() {
        
        NSLayoutConstraint.activate([
            repositoryNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            repositoryNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            repositoryOwnerNameLabel.topAnchor.constraint(equalTo: repositoryNameLabel.topAnchor, constant: 25),
            repositoryOwnerNameLabel.leftAnchor.constraint(equalTo: repositoryNameLabel.leftAnchor)
        ])
    }
    
    func configureAdditionalBehaviors() {
        accessoryType = .disclosureIndicator
    }
}
