//
//  RepositoryInfoView.swift
//  GitHubApp
//
//  Created by Pedro Francisco Tres on 27/01/22.
//

import Foundation
import UIKit

class RepositoryInfoView: UIView {
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelDescription: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelStarsForks: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    public func updateView(with configuration: RepositoryInfoViewConfiguration) {
        let repositoryTitle = configuration.title
        let repositoryDescription = configuration.description
        let repositoryStarsBifurcations = String.repositoryInfo(repositoriesCount: configuration.stars,
                                                                bifurcationsCount: configuration.bifurcations)
        labelTitle.text = repositoryTitle
        labelDescription.text = repositoryDescription
        labelStarsForks.text = repositoryStarsBifurcations
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RepositoryInfoView: ViewCode{
    func configureSubViews() {
        self.backgroundColor = .white
        self.addSubview(stackView)
        stackView.addArrangedSubview(labelTitle)
        stackView.addArrangedSubview(labelDescription)
        stackView.addArrangedSubview(labelStarsForks)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    func configureAdditionalBehaviors() {}
}


