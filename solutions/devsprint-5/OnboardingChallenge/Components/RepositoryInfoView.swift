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
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [repositoryName,
                                                   repositoryDescription,
                                                   starsAndBifurcation])
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
        self.addSubview(stackView)
    }
    
    func configureConstraints() {
        stackView.anchor(top: topAnchor,
                                  leading: leadingAnchor,
                                  bottom: bottomAnchor,
                                  trailing: trailingAnchor,
                                  padding: UIEdgeInsets(top: 0,
                                                        left: 20,
                                                        bottom: 20,
                                                        right: 20))
    }
    
    func updateView(with configuration: RepositoryInfoViewConfiguration) {
        repositoryName.text = configuration.repositoryName
        repositoryDescription.text = configuration.description
        starsAndBifurcation.text = String.repositoryInfo(starsCount: configuration.starNumber, bifurcationsCount: configuration.bifurcations)
    }
}
