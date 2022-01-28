//
//  ButtonProfile.swift
//  GitHubApp
//
//  Created by Tania Mara Alves Ferreira on 26/01/22.
//
import UIKit

struct DefaultButton {
    func setupConstraints(_ button: UIButton,
                                  _ width: CGFloat,
                                  _ height: CGFloat) {
        button.widthAnchor.constraint(equalToConstant: width).isActive = true
        button.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func makeButton(withText text: String,
                           width: CGFloat = 100,
                           height: CGFloat = 30) -> UIButton {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        button.backgroundColor = .blue
        button.titleLabel?.font = .systemFont(ofSize: 18)
        
        setupConstraints(button, width, height)
        return button
    }
}



