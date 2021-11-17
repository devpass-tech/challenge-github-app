//
//  OwnerView.swift
//  OnboardingChallenge
//
//  Created by Karina Martins Silva on 12/11/21.
//
import Foundation
import UIKit

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
        stackView.spacing = 5
        stackView.axis = .vertical
        stackView.alignment = .trailing
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
        title.font = .boldSystemFont(ofSize: 18)
        title.textColor = .black
        title.text = "Owner"
        return title
    }()

    private var accountName: UILabel = {
        let account = UILabel()
        account.translatesAutoresizingMaskIntoConstraints = false
        account.textColor = .black
        account.font = .systemFont(ofSize: 16)
        account.text = "Rodrigo Borges"
        return account
    }()

    private var bioDescription: UILabel = {
        let bio = UILabel()
        bio.translatesAutoresizingMaskIntoConstraints = false
        bio.font = .systemFont(ofSize: 14)
        bio.textColor = .lightGray
        bio.text = "Mobile Tech Lead"
        return bio
    }()

    private var repositoryImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 100, height: 100))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "100x100.gif")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = image.frame.size.height/2
        return image
    }()

    private var profileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.setTitle("See profile", for: .normal)
        button.layer.cornerRadius = 7
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
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
        stackData.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        stackData.isLayoutMarginsRelativeArrangement = true
        stackData.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackData.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackData.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true

        stackImage.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 20)
        stackImage.isLayoutMarginsRelativeArrangement = true
        stackImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        stackImage.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackImage.bottomAnchor.constraint(equalTo: stackButton.topAnchor).isActive = true
        stackImage.setCustomSpacing(30, after: repositoryImage)

        stackButton.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        stackButton.isLayoutMarginsRelativeArrangement = true
        stackButton.topAnchor.constraint(equalTo: stackData.bottomAnchor, constant: 30).isActive = true
        stackButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true


    }

    func updateView(with configuration: OwnerViewConfiguration) {
        repositoryTitle.text = configuration.title
        accountName.text = configuration.account
        bioDescription.text = configuration.bio
        repositoryImage.image = configuration.image
    }
}
