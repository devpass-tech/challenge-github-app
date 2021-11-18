//
//  RepositoryInfoView.swift
//  OnboardingChallenge
//
//  Created by Mateus Coelho on 18/11/21.
//

import Foundation
import UIKit

final class RepositoryInfoView: UIView {
    // MARK: Init
    init() {
        super.init(frame: .zero)
        configureSubviews()
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UIComponents
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var labelRepositoryName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var labelRepositoryDescription: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var labelRepositoryStarsBifurcations: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    // MARK: Methods
    private func configureSubviews(){
        self.backgroundColor = .white
        self.addSubview(stackView)
        stackView.addArrangedSubview(labelRepositoryName)
        stackView.addArrangedSubview(labelRepositoryDescription)
        stackView.addArrangedSubview(labelRepositoryStarsBifurcations)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    public func updateView(with configuration: RepositoryInfoViewConfiguration) {
        let repositoryName = configuration.name
        let repositoryDescription = configuration.description
        let repositoryStarsBifurcations = String.repositoryInfo(repositoriesCount: configuration.stars,
                                                                bifurcationsCount: configuration.bifurcations)
        labelRepositoryName.text = repositoryName
        labelRepositoryDescription.text = repositoryDescription
        labelRepositoryStarsBifurcations.text = repositoryStarsBifurcations
    }
}
