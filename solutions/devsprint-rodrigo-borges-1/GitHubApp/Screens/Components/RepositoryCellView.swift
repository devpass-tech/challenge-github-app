//
//  RepositoryCellView.swift
//  GitHubApp
//
//  Created by Enrick on 18/01/22.
//

import UIKit

struct RepositoryCellViewConfiguration {
    let repositoryLabel: String
    let repositoryOwnerLabel: String
}

class RepositoryCellView: UITableViewCell {
    
    private let repositoryLabel: UILabel = {
      let label = UILabel()
      label.font = UIFont.boldSystemFont(ofSize: 20)
      return label
   }()
   
   private let repositoryOwnerLabel: UILabel = {
     let label = UILabel()
     label.font = UIFont.systemFont(ofSize: 16)
     label.textColor = .lightGray
     return label
  }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [repositoryLabel, repositoryOwnerLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configureSubviews()
        self.configureSubviewsConstraints()
        self.configureAdditionalBehaviors()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with configuration: RepositoryCellViewConfiguration) {
        repositoryLabel.text = configuration.repositoryLabel
        repositoryOwnerLabel.text = configuration.repositoryOwnerLabel
    }
    
}

extension RepositoryCellView {
    func configureSubviews() {
            addSubview(stackView)
        }

        func configureSubviewsConstraints() {
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                stackView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            ])
        }

        func configureAdditionalBehaviors() {
            accessoryType = .disclosureIndicator
        }
}
