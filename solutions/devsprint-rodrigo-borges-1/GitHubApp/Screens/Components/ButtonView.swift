//
//  ButtonView.swift
//  GitHubApp
//
//  Created by Tania Mara Alves Ferreira on 24/01/22.
//

import Foundation
import UIKit

func defaultButton(withText text: String) -> UIButton {
    
   let button = UIButton()
    
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(text, for: .normal)
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    button.backgroundColor = .blue
    button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
    
    return button
}
