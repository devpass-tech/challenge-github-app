//
//  ButtonView.swift
//  OnboardingChallenge
//
//  Created by Gustavo Soares on 12/11/21.
//

import UIKit

struct ButtonViewConfiguration {
    var title: String
    var action: UIAction?
}

class ButtonView: UIView {
    
    private(set) var heightButton: CGFloat = 60
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    func updateView(with buttonViewConfiguration: ButtonViewConfiguration) {
        button.setTitle(buttonViewConfiguration.title, for: .normal)
        
        guard let action = buttonViewConfiguration.action else { return }
        button.addAction(action, for: .touchUpInside)
    }
}

extension ButtonView: ViewCode {
    func configureSubViews() {
        addSubview(button)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: heightButton),
            button.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    func configureAdditionalBehaviors() {
        backgroundColor = .white
    }
}
