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
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var additionalLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .gray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: ButtonView = {
        let button = ButtonView()
        button.updateView(with: .init(buttonText: "See License"))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: inits
    init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: configuration
    struct LicenseViewConfiguration {
        let title: String
        let subTitle: String
        let addicional: String
    }
    
    // MARK: methods
    func updateView(with configuration: LicenseViewConfiguration) {
        titleLabel.text = configuration.title
        subTitleLabel.text = configuration.subTitle
        additionalLabel.text = configuration.addicional
    }
}

extension LicenseView: ViewCode {
    func setupSubviews() {
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(additionalLabel)
        addSubview(button)
    }

    func setupConstraint() {
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            self.subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.additionalLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 8),
            self.additionalLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.additionalLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.button.topAnchor.constraint(equalTo: additionalLabel.bottomAnchor, constant: 16),
            self.button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
        ])
    }

    func setupExtraConfiguration() { }
}
