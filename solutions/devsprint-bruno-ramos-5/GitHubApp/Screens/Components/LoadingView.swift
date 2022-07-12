//
//  LoadingView.swift
//  GitHubApp
//
//  Created by Luciano Berchon on 06/07/22.
//

import Foundation
import UIKit


final class LoadingView: UIView {
    struct LoadingViewConfiguration {
        let text: String
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Searching repositories..."
        return label
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 16
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func updateView(with configuration: LoadingViewConfiguration) {
        label.text = configuration.text
    }
}

extension LoadingView: ViewCode {
    func setupSubviews() {
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(activityIndicator)
        addSubview(stackView)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setupExtraConfiguration() {
        self.backgroundColor = .systemBackground
    }
}
