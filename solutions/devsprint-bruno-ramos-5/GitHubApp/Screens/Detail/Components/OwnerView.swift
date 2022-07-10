//
//  OwnerView.swift
//  GitHubApp
//
//  Created by Vitor Conceicao on 08/07/22.
//

import UIKit

final class OwnerView: UIView {
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 25, weight: .bold)
        return titleLabel
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.font = .systemFont(ofSize: 17)
        return subtitleLabel
    }()
    
    private lazy var additionalLabel: UILabel = {
        let additionalLabel = UILabel()
        additionalLabel.font = .systemFont(ofSize: 15)
        additionalLabel.textColor = .gray
        return additionalLabel
    }()
    
    private lazy var imageView: UIImageView = {
        let ownerImageView = UIImageView()
        ownerImageView.translatesAutoresizingMaskIntoConstraints = false
        return ownerImageView
    }()
    
    private lazy var button: ButtonView = {
        let profileButton = ButtonView()
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.updateView(with: .init(buttonText: "See profile"))
        return profileButton
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 10
        verticalStackView.alignment = .leading
        verticalStackView.distribution = .fill
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        return verticalStackView
    }()
    
    // MARK: configuration
    
    struct OwnerViewConfiguration {
        let title: String
        let subTitle: String
        let additionInfo: String
        let image: UIImage?
    }
    
    // MARK: inits
    
    convenience init() {
        self.init(frame: .zero)
        setup()
    }
    
    // MARK: methods
    
    func updateView(with configuration: OwnerViewConfiguration) {
        titleLabel.text = configuration.title
        subtitleLabel.text = configuration.subTitle
        additionalLabel.text = configuration.additionInfo
        imageView.image = configuration.image
    }
}

extension OwnerView: ViewCode {
    func setupSubviews() {
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subtitleLabel)
        verticalStackView.addArrangedSubview(additionalLabel)
        
        addSubview(verticalStackView)
        addSubview(imageView)
        addSubview(button)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -10),
            
            imageView.centerYAnchor.constraint(equalTo: verticalStackView.centerYAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            
            button.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: 20),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
        ])
    }
    
    func setupExtraConfiguration() {}
}
