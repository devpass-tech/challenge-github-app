//
//  DetailView.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Francischett Occhiuto on 09/11/21.
//

import Foundation
import UIKit

class DetailView: UIView {
    
    private var repositoryStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .lightGray
        return stackView
    }()
    
    private var ownerStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .lightGray
        return stackView
    }()
    
    private var ownerView: OwnerView = {
        let ownerView = OwnerView()
        ownerView.translatesAutoresizingMaskIntoConstraints = false
        return ownerView
    }()
    
    private var repositoryInfoView: RepositoryInfoView = {
        let repositoryInfoView = RepositoryInfoView()
        repositoryInfoView.translatesAutoresizingMaskIntoConstraints = false
        return repositoryInfoView
    }()
    
    init() {
        super.init(frame: .zero)
        configureSubview()
        configureConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubview() {
        backgroundColor = .white
        addSubview(repositoryStack)
        addSubview(ownerStack)
        repositoryStack.addArrangedSubview(repositoryInfoView)
        ownerStack.addArrangedSubview(ownerView)
    }
    
    func configureConstraint() {
        repositoryStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        repositoryStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        repositoryStack.widthAnchor.constraint(equalToConstant: 400).isActive = true
        repositoryStack.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        ownerStack.leadingAnchor.constraint(equalTo: repositoryStack.leadingAnchor).isActive = true
        ownerStack.heightAnchor.constraint(equalToConstant: 300).isActive = true
        ownerStack.topAnchor.constraint(equalTo: repositoryStack.bottomAnchor).isActive = true
        ownerStack.trailingAnchor.constraint(equalTo: repositoryStack.trailingAnchor).isActive = true
    }
}
