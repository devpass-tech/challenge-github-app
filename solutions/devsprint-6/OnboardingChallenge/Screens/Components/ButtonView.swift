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
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.layer.cornerRadius = frame.height/2
        button.layer.borderWidth = 1
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
        button.titleLabel?.text = buttonViewConfiguration.title
        button.addAction(buttonViewConfiguration.action, for: .touchUpInside)
    }
}

extension ButtonView: ViewCode {
    func configureSubViews() {
        addSubview(button)
    }
    
    func configureSubviewsConstraints() {
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func configureAdditionalBehaviors() {}
}
