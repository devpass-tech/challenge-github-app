//
//  RepositoryInfoView.swift
//  OnboardingChallenge
//
//  Created by Karina Martins Silva on 17/11/21.
//
import Foundation
import UIKit

struct RepositoryInfoViewConfiguration {
    var repositoryName: String
    var description: String
    var starNumber: Int
    var bifurcations: Int
}

final class RepositoryInfoView: UIView {
    
    private var repositoryName: UILabel = {
        let repoName = UILabel()
        repoName.font = UIFont.boldSystemFont(ofSize: 24)
       return repoName
    }()
    
    private var repositoryDescription: UILabel = {
        let description = UILabel()
        description.numberOfLines = 0
        description.font = UIFont.systemFont(ofSize: 17)
        return description
    }()
    
    private var starsAndBifurcation: UILabel = {
        let stars = UILabel()
        stars.textColor = .lightGray
        stars.font = UIFont.systemFont(ofSize: 14)
        return stars
    }()
    
    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 2
        stack.alignment = .fill
        stack.axis = .vertical
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    init() {
        super.init(frame: .zero)
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviews() {
        self.backgroundColor = .white
        self.addSubview(stackView)
        stackView.addArrangedSubview(repositoryName)
        stackView.addArrangedSubview(repositoryDescription)
        stackView.addArrangedSubview(starsAndBifurcation)
    }
    
    func configureConstraints() {
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.setCustomSpacing(5, after: repositoryName)
        stackView.setCustomSpacing(10, after: repositoryDescription)
    }
    
    func updateView(with configuration: RepositoryInfoViewConfiguration) {
        repositoryName.text = configuration.repositoryName
        repositoryDescription.text = configuration.description
        starsAndBifurcation.text = String.repositoryInfo(starsCount: configuration.starNumber, bifurcationsCount: configuration.bifurcations)
    }
}
