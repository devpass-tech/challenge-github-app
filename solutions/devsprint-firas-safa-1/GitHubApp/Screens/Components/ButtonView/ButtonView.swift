//
//  ButtonView.swift
//  GitHubApp
//
//  Created by Enrick on 08/02/22.
//

import UIKit

class ButtonView: UIView {
    
    private let buttonHeight: CGFloat = 56
    
    private lazy var primaryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with configuration: ButtonViewConfiguration) {
        primaryButton.setTitle(configuration.title, for: .normal)
        primaryButton.addAction(configuration.action, for: .touchUpInside)
    }
}

extension ButtonView {
    func customizeInterface() {
        backgroundColor = .white
        configureSubviews()
        configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        addSubview(primaryButton)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            primaryButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            primaryButton.topAnchor.constraint(equalTo: topAnchor),
            primaryButton.leftAnchor.constraint(equalTo: leftAnchor),
            primaryButton.rightAnchor.constraint(equalTo: rightAnchor),
            primaryButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])


    }
}
