//
//  EmptyView.swift
//  OnboardingChallenge
//
//  Created by Murillo R. Araújo on 16/10/21.
//

import Foundation
import UIKit

final class EmptyView: UIView {
    
    
    private var titleLabel = UILabel()
    private var messageLabel = UILabel()
    private var stackView = UIStackView()
    
    init() {
        super.init(frame: .zero)
        
        configureTitleLabel()
        configureMessageLabel()
        configureStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateView(with configuration: EmptyViewConfiguration) {
        titleLabel.text = configuration.titleMessage
        messageLabel.text = configuration.emptyMessage
    }
    
    func configureTitleLabel() {
        self.addSubview(titleLabel)
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .center
    }
    
    func configureMessageLabel() {
        self.addSubview(messageLabel)
        messageLabel.textColor = UIColor.gray
        messageLabel.font = UIFont.systemFont(ofSize: 14)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 2
        messageLabel.lineBreakMode = .byClipping
    }
    
    func configureStackView() {
        self.backgroundColor = .white
        self.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 10
        
        setStackViewConstraints()
        addLabelsToStackView()
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -70),
        ])
    }
    
    func addLabelsToStackView() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(messageLabel)
    }
}
