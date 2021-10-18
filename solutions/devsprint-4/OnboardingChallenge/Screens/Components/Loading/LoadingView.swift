//
//  LoadingView.swift
//  OnboardingChallenge
//
//  Created by Pedro Henrique on 17/10/21.
//

import UIKit
import Foundation

class LoadingView: UIView {
    
    // MARK: - Properties
    lazy var message: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.translatesAutoresizingMaskIntoConstraints = false
        let transform = CGAffineTransform(scaleX: 2, y: 2)
        ai.transform = transform
        ai.startAnimating()
        return ai
    }()
    
    // MARK: Initialization
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        addSubviews()
        constrainsMessage()
        constrainsactivityIndicator()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    public func updateView(with configuration: LoadingViewConfiguration) {
        message.text = configuration.message
    }
    
    private func addSubviews(){
        self.addSubview(message)
        self.addSubview(activityIndicator)
    }
    
    private func constrainsMessage(){
        let constraint = [
            message.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            message.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ]
        constraint.forEach {(item) in
            item.isActive = true
        }
    }
    
    private func constrainsactivityIndicator(){
        let constraint = [
            activityIndicator.topAnchor.constraint(equalTo: message.bottomAnchor, constant: 30),
            activityIndicator.centerXAnchor.constraint(equalTo: message.centerXAnchor)
        ]
        constraint.forEach {(item) in
            item.isActive = true
        }
    }
}
