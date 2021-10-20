//
//  RepositoryInfoView.swift
//  OnboardingChallenge
//
//  Created by Fabio Martinez on 13/10/21.
//



import Foundation
import UIKit

final class RepositoryInfoView: UIView {
    
    private var stackView: UIStackView = {
        
        let stackView = UIStackView ()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        
        return stackView
    }()
    
    private var repositoryNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private var starRepositoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    
    init() {
        
        super.init(frame: .zero)
        
        self.configureSubview()
        self.configureConstraints()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubview(){
        self.backgroundColor = .white
        self.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.repositoryNameLabel)
        self.stackView.addArrangedSubview(self.descriptionLabel)
        self.stackView.addArrangedSubview(self.starRepositoryLabel)
        
        
    }
    
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            
            self.stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            
        ])
        
    }
    
    public func updateView(with configuration: RepositoryInfoViewConfiguration) {
        
        self.repositoryNameLabel.text = configuration.name
        self.descriptionLabel.text = configuration.description
        self.starRepositoryLabel.text = "\(configuration.stars) estrelas   \(configuration.bifurcation) bifurcações"
        
        
        
    }
    
}
