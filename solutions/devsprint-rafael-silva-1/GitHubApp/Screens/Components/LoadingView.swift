//
//  LoadingView.swift
//  GitHubApp
//
//  Created by Frédéric Helfer on 14/12/22.
//

import UIKit

class LoadingView: UIView {
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 14
        return stack
    }()
    
    lazy var loadingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Searching repositories..."
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    lazy var loadingIndicatorView: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.style = .large
        spinner.startAnimating()
        return spinner
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
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
        addSubview(stackView)
        stackView.addArrangedSubview(loadingLabel)
        stackView.addArrangedSubview(loadingIndicatorView)
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([

            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
    }
}

extension LoadingView {

//    func updateView(with configuration: LoadingViewConfiguration) {
//        loadingLabel.text = configuration...
//    }
}
