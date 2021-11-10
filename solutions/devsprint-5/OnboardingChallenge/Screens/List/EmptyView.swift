//
//  EmptyView.swift
//  OnboardingChallenge
//
//  Created by Luiza Moruz on 10/11/21.
//

import Foundation
import UIKit


final class EmptyView: UIView {
    
    private var emptyTitleLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No repositories found"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .justified
        
        return label
    }
    private var emptySubtitleLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Search for users to see their public repositories here!"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .justified
        
        return label
    }
    
    
/*
     ainda nao sei como ligar as duas UIViews dentro de uma stack view, acredito que usar uma stackView facilitaria a centralizacao dos elementos na view, através das constraints
     
     private let stackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
        
    }()
*/
    
    init() {
        super.init(frame: .zero)
        
        self.configureSubview()
        self.configureConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  /*
     não tenho certeza de como implementar o metodo abaixo:
 
 func updateView(with configuration: EmptyViewConfiguration)
    
 */
    
    private func configureSubview() {
        self.backgroundColor = .none
        
        self.addSubview(self.emptyTitleLabel)
        
        self.addSubview(self.emptySubtitleLabel)
        
    }
    
    private func configureConstraints() {
        
            self.emptyTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            self.emptyTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
            self.emptySubtitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            self.emptySubtitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            
    }
}
