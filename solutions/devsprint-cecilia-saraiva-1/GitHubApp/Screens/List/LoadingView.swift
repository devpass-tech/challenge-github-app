//
//  ListLoadingView.swift
//  GitHubApp
//
//  Created by Pierre Youness on 29/07/2022.
//

import UIKit

struct LoadingViewConfiguration {
    let description: String
}


final class LoadingView: UIView {
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    private let labelLoadingDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.alignment = .center
        sv.spacing = 14
        return sv
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension LoadingView {
    
    func setupViews() {
        
        self.backgroundColor = .white
        
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        
        stackView.addArrangedSubview(labelLoadingDescription)
        stackView.addArrangedSubview(activityIndicator)
        
        self.addSubview(stackView)
        
        activityIndicator.startAnimating()
    }
    
    func configureSubviewsConstraints() {
        
        NSLayoutConstraint.activate([
            self.stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
}


extension LoadingView {
    
    func updateView(with configuration: LoadingViewConfiguration) {
        self.labelLoadingDescription.text = configuration.description
    }
}
