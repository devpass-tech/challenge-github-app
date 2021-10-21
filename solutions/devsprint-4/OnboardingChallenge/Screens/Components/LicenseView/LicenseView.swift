//
//  LicenseView.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 21/10/21.
//

import UIKit

final class LicenseView: UIView {

    private var stackView: UIStackView = {

        let stackView = UIStackView ()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    private var titleLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "License"
        return label
    }()

    private var nameLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    private var codeLabel: UILabel = {

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()

    private var viewLicenseButton: UIButton = {

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("See license", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 0, green: 122, blue: 255)
        return button
    }()


    init() {

        super.init(frame: .zero)

        self.configureSubview()
        self.configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubview() {

        self.backgroundColor = .white
        self.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.titleLabel)
        self.stackView.addArrangedSubview(self.nameLabel)
        self.stackView.addArrangedSubview(self.codeLabel)
        self.stackView.addArrangedSubview(self.viewLicenseButton)
    }

    private func configureConstraints() {

        NSLayoutConstraint.activate([

            self.stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),

            self.viewLicenseButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    public func updateView(with configuration: LicenseViewConfiguration) {

        self.nameLabel.text = configuration.name
        self.codeLabel.text = configuration.code
    }

}

