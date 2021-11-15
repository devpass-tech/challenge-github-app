//
//  ButtonView.swift
//  OnboardingChallenge
//
//  Created by Gustavo Soares on 12/11/21.
//

import UIKit

struct ButtonViewConfiguration {
    var title: String
    var action: UIAction
}

class ButtonView: UIView {
    
    private(set) var buttonWidth: CGFloat = 300
    private(set) var buttonHeight: CGFloat = 60
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
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
        button.addAction(buttonViewConfiguration.action, for: .touchUpInside)
    }
}

extension ButtonView: ViewCode {
    func configureSubViews() {
        addSubview(button)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: buttonWidth),
            button.heightAnchor.constraint(equalToConstant: buttonHeight),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    func configureAdditionalBehaviors() {
        backgroundColor = .white
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
    }
}
