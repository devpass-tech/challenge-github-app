//
//  LoadingView.swift
//  GitHubApp
//
//  Created by Felipe Forcinetti on 18/01/22.
//

import UIKit

final class LoadingView: UIView {
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        configSubview()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with viewModel: LoadingViewConfiguration) {
        textLabel.text = viewModel.textLabel
    }
    
    private func configSubview() {
        addSubview(textLabel)
        addSubview(indicatorView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            indicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicatorView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 16)
            
        ])
    }

}
