//
//  ButtonView.swift
//  GitHubApp
//
//  Created by Pierre Younes on 31/07/2022.
//

import UIKit

struct ButtonViewConfiguration {
    let title: String
    let callback: (() -> Void)?
}

final class ButtonView: UIView {
    
    private let button: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 14
        button.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            self.button.topAnchor.constraint(equalTo: self.topAnchor),
            self.button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.button.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func updateView(with configuration: ButtonViewConfiguration) {
        self.button.setTitle(configuration.title, for: .normal)
        let action = UIAction(title: "") { action in
            configuration.callback?()
        }
        self.button.addAction(action, for: .touchUpInside)
    }
}
