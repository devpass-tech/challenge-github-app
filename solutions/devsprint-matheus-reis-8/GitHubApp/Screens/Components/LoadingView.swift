//
//  LoadingView.swift
//  GitHubApp
//
//  Created by Lucas Gomes on 04/04/23.
//

import UIKit

struct LoadingViewConfiguration {
    let title: String
}

final class LoadingView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Searching repositories..."
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var spinnerActivityIndicator: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension LoadingView {
    func setupViews() {
        backgroundColor = .white
        configureSubviews()
        configureSubviewsConstraints()
    }

    func configureSubviews() {
        addSubview(titleLabel)
        addSubview(spinnerActivityIndicator)
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            spinnerActivityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinnerActivityIndicator.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14),
        ])
    }
}

extension LoadingView {
    func updateView(with configuration: LoadingViewConfiguration) {
        titleLabel.text = configuration.title
    }
    
    func startAnimating() {
        spinnerActivityIndicator.startAnimating()
    }
    
    func stopAnimating() {
        spinnerActivityIndicator.stopAnimating()
    }
}
