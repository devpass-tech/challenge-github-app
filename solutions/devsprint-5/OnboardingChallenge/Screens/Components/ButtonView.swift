//
//  ButtonView.swift
//  OnboardingChallenge
//
//  Created by Gui Feitosa on 17/11/21.
//

import Foundation
import UIKit

struct ButtonViewConfiguration {
    var title: String
    var action: UIAction
}

class ButtonView: UIView {
    
    
    lazy var button: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.tintColor = .white
        button.layer.cornerRadius = 18
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with configuration: ButtonViewConfiguration) {
        button.setTitle(configuration.title, for: .normal)
        button.addAction(configuration.action, for: .touchUpInside)
    }
    
    private func configSuperViews() {
        self.addSubview(self.button)
    }
}
