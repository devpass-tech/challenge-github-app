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
        label.isHidden = true
        return label
    }()
    
    private lazy var spinnerActivityIndicator: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        spinner.stopAnimating()
        return spinner
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
        self.addSubview(self.titleLabel)
        self.addSubview(self.spinnerActivityIndicator)
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.spinnerActivityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.spinnerActivityIndicator.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 14),
        ])
    }
}

extension LoadingView {
    func updateView(with configuration: LoadingViewConfiguration) {
        titleLabel.text = configuration.title
    }
    
    func showLoadingViewSpinnerActivityIndicator() {
        spinnerActivityIndicator.startAnimating()
    }
    
    func hideLoadingViewSpinnerActivityIndicator() {
        spinnerActivityIndicator.stopAnimating()
    }
    
    func showLoadingViewTitleLabel() {
        titleLabel.isHidden = false
    }
    
    func hideLoadingViewTitleLabel() {
        titleLabel.isHidden = true
    }
}
