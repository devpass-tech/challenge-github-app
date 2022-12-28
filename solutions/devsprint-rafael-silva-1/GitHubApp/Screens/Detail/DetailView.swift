//
//  DetailView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 07/01/22.
//

import UIKit

class DetailView: UIView {
    
    lazy var repositoryInfoView: RepositoryInfoView = {
        let view = RepositoryInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        // Usar os dados do Repository
        view.updateView(with: RepositoryInfoViewConfiguration(repoTitle: "Título", repoDescription: "Descrição", stars: 15, forks: 4))
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DetailView {
    
    func setupViews() {
        backgroundColor = .systemBackground
        
        configureSubviews()
        configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        addSubview(repositoryInfoView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
        
            repositoryInfoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            repositoryInfoView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            repositoryInfoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
}
