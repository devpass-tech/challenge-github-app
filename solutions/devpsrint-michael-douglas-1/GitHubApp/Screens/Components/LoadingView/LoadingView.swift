//
//  LoadingView.swift
//  GitHubApp
//
//  Created by Fabio Martinez on 21/01/22.
//

import UIKit

final class LoadingView: UIView {
    
    // MARK: Properties
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var indicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = .darkGray
        view.startAnimating()
        return view
    }()
    
    // MARK: Initializers
    init() {
        super.init(frame: .zero)
        configureSubview()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    func updateView(with viewModel: LoadingViewConfiguration) {
        textLabel.text = viewModel.textLabel
    }
    
    private func configureSubview() {
        backgroundColor = .white
        addSubview(textLabel)
        addSubview(indicatorView)
    }
    
    // MARK: Constraints
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            indicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicatorView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 15),
        ])
    }
}
