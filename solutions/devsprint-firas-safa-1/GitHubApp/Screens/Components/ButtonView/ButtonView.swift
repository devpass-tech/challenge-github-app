//
//  ButtonView.swift
//  GitHubApp
//
//  Created by Enrick on 08/02/22.
//

import UIKit

class ButtonView: UIButton {
    
    static let buttonHeight: CGFloat = 56

    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ButtonView {
    func customizeInterface() {
        configureStyles()
    }

    func configureStyles() {
        setTitleColor(.white, for: .normal)
        backgroundColor = .systemBlue
        layer.cornerRadius = 14
        titleLabel?.font =  UIFont.boldSystemFont(ofSize: 18)
        heightAnchor.constraint(equalToConstant: ButtonView.buttonHeight).isActive = true
    }
}
