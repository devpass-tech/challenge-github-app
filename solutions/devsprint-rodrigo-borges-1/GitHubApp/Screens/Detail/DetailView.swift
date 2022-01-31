//
//  DetailView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 07/01/22.
//

import UIKit

final class DetailView: UIView {
    
    private lazy var repositoryInfoView: RepositoryInfoView = {
        let repositoryInfoView = RepositoryInfoView()
        repositoryInfoView.translatesAutoresizingMaskIntoConstraints = false
        repositoryInfoView.updateView(with: RepositoryInfoViewConfiguration(title: "hereminders-ios", description: "O Hereminders é um app de lembretes geolocalizados, implementado em Swift com arquitetura MVVM-C", stars: 5, bifurcations: 17))
        return repositoryInfoView
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailView: ViewCode {
    func configureSubViews() {
        addSubview(repositoryInfoView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            self.repositoryInfoView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.repositoryInfoView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.repositoryInfoView.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    func configureAdditionalBehaviors() {
        backgroundColor = .white
    }
}
