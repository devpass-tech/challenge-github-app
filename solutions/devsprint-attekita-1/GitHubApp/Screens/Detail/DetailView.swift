//
//  DetailView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 07/01/22.
//

import UIKit

final class DetailView: UIView, ViewCodable {
    
    private lazy var verticalStack:UIStackView = {
        let view  = UIStackView(frame: .zero)
        view.alignment = .fill
        view.spacing = 8
        view.axis = .vertical
        view.distribution = .fillProportionally
        return view
    }()
    
    private lazy var repositoryInfoView: RepositoryInfoView = RepositoryInfoView()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        setupView()
        
        repositoryInfoView.updateView(with: RepositoryInfoViewConfiguration(repositoryName: "Dev Sprint Attekita", repositoryDescription: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum" , repositoryStars: 5, repositoryForks: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        addSubview(verticalStack)
        verticalStack.addArrangedSubview(repositoryInfoView)
    }
    
    func setupConstraints() {
        verticalStack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        verticalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        verticalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        verticalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        repositoryInfoView.leadingAnchor.constraint(equalTo:verticalStack.leadingAnchor).isActive = true
        repositoryInfoView.trailingAnchor.constraint(equalTo:verticalStack.trailingAnchor).isActive = true
        repositoryInfoView.translatesAutoresizingMaskIntoConstraints = false
    }
}
