//
//  LicenseView.swift
//  GitHubApp
//
//  Created by Luciano Berchon on 08/07/22.
//

import UIKit

final class LicenseView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "License"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "GNU General Public License v2.0 xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx"
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var additionalLabel: UILabel = {
        let label = UILabel()
        label.text = "GPL-2.0"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("See License", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension LicenseView: ViewCode {
    func setupSubviews() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(additionalLabel)
        addSubview(button)
    }

    func setupConstraint() {
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            self.subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.additionalLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 8),
            self.additionalLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.additionalLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.button.topAnchor.constraint(equalTo: additionalLabel.bottomAnchor, constant: 16),
            self.button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            self.button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    func setupExtraConfiguration() {
        self.backgroundColor = .green
    }
}
