//
//  EmptyView.swift
//  OnboardingChallenge
//
//  Created by Luiza Moruz on 10/11/21.
//

import Foundation
import UIKit


struct EmptyViewConfiguration {
    var title: String
    var subtitle: String
}

final class EmptyView: UIView {
    
    private var emptyTitleLabel: UILabel {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        
        return label
    }
    
    private var emptySubtitleLabel: UILabel {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        
        return label
    }
    
     private let stackView: UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20

        return stackView
        
    }()
    
    init() {
        super.init(frame: .zero)
        
        self.configureStackView()
        self.configureStackViewConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureStackView() {
        
        self.backgroundColor = .white
        
        self.addSubview(stackView)
        self.stackView.addArrangedSubview(self.emptyTitleLabel)
        self.stackView.addArrangedSubview(self.emptySubtitleLabel)
        
        configureStackViewConstraints()
        
    }
    
    private func configureStackViewConstraints() {
        NSLayoutConstraint.activate([
            
        self.stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
        self.stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        self.stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
        self.stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
                    
      ])

    }
    
    func updateView(configuration: EmptyViewConfiguration) {
        emptyTitleLabel.text = configuration.title
        emptySubtitleLabel.text = configuration.title
        
    }

}

