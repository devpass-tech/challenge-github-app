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
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 16, weight: .semibold)
        return button
    }()
    
    var titleColor: UIColor = .orange {
        didSet {
            updateUI()
        }
    }
    
    var primaryColor: UIColor = .orange {
        didSet {
            updateUI()
        }
    }
    
    var cornerRadius: Double = 0.0 {
        didSet {
            updateUI()
        }
    }
    
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
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        addSubview(button)
    }
    
    private func addConstraints() {
        button.topAnchor.constraint(equalTo: topAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: readableContentGuide.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: readableContentGuide.rightAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func updateUI() {
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = primaryColor
        button.layer.cornerRadius = cornerRadius
    }
    
    func updateButtonView(with configuration: ButtonViewConfiguration) {
        button.setTitle(configuration.title, for: .normal)
    }
}
