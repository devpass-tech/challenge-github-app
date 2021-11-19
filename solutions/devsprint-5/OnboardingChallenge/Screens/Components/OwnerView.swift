//
//  OwnerView.swift
//  OnboardingChallenge
//
//  Created by Karina Martins Silva on 12/11/21.
//

import UIKit
import Foundation


struct OwnerViewConfiguration {
    var title: String
    var account: String
    var bio: String
    var image: UIImage
}

final class OwnerView: UIView {

    private var stackData: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()

    private var stackImage: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()

    private var stackButton: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()


    private var repositoryTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .boldSystemFont(ofSize: 24)
        title.textColor = .black
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        return title
    }()

    private var accountName: UILabel = {
        let account = UILabel()
        account.translatesAutoresizingMaskIntoConstraints = false
        account.textColor = .black
        account.font = .systemFont(ofSize: 16)
        account.numberOfLines = 0
        account.lineBreakMode = .byWordWrapping
        return account
    }()

    private var bioDescription: UILabel = {
        let bio = UILabel()
        bio.translatesAutoresizingMaskIntoConstraints = false
        bio.font = .systemFont(ofSize: 14)
        bio.textColor = .lightGray
        bio.numberOfLines = 0
        bio.lineBreakMode = .byWordWrapping
        return bio
    }()

    private var repositoryImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 25
        return image
    }()

    private var profileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.setTitle("See profile", for: .normal)
        button.layer.cornerRadius = 9
        return button
    }()

    init() {
        super.init(frame: .zero)
        configureSubview()
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureSubview() {
        self.backgroundColor = .white
        stackData.addArrangedSubview(repositoryTitle)
        stackData.addArrangedSubview(accountName)
        stackData.addArrangedSubview(bioDescription)
        stackImage.addArrangedSubview(repositoryImage)
        stackButton.addArrangedSubview(profileButton)
        addSubview(stackData)
        addSubview(stackImage)
        addSubview(stackButton)
    }

    func configureConstraints() {
        stackData.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackData.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackData.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
        stackData.isLayoutMarginsRelativeArrangement = true
        stackData.setCustomSpacing(10, after: repositoryTitle)
        stackData.setCustomSpacing(10, after: accountName)
        stackData.setCustomSpacing(10, after: bioDescription)
        
        
        stackImage.topAnchor.constraint(equalTo: repositoryTitle.bottomAnchor).isActive = true
        stackImage.trailingAnchor.constraint(equalTo: profileButton.trailingAnchor).isActive = true
        stackImage.bottomAnchor.constraint(equalTo: stackData.bottomAnchor).isActive = true
        stackImage.leadingAnchor.constraint(equalTo: stackData.trailingAnchor).isActive = true

        repositoryImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        repositoryImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
  
        
        stackButton.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        stackButton.isLayoutMarginsRelativeArrangement = true
        stackButton.widthAnchor.constraint(equalToConstant: 400).isActive = true
        stackButton.leadingAnchor.constraint(equalTo: stackData.leadingAnchor).isActive = true
        stackButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackButton.topAnchor.constraint(equalTo: stackData.bottomAnchor, constant: 18).isActive = true
        
        profileButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    func updateView(with configuration: OwnerViewConfiguration) {
        repositoryTitle.text = configuration.title
        accountName.text = configuration.account
        bioDescription.text = configuration.bio
        repositoryImage.image = configuration.image
    }
}

