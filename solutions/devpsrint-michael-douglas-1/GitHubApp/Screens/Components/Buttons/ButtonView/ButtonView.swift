//
//  ButtonView.swift
//  GitHubApp
//
//  Created by Gustavo Rocha on 24/01/22.
//

import UIKit

class ButtonView: UIView {
    
    // MARK: Properties
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Initialization

    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    private func setupUI() {
        backgroundColor = .white
    }
}
