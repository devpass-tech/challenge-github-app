//
//  OwnerView.swift
//  OnboardingChallenge
//
//  Created by Gustavo Soares on 16/11/21.
//

import UIKit

struct OwnerViewConfiguration {
    var ownerName: String
    var ownerJobTitle: String
    var onwerImage: UIImage?
}

final class OwnerView: UIView {
    
    private(set) var profileImageHeight: CGFloat = 60
    
    private var ownerProfileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var ownerInformationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var titleOwnerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Owner"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var titleOwnerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var titleOwnerJobTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var ownerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var ownerProfileButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("See profile", for: .normal)
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    func updateView(with configuration: OwnerViewConfiguration) {
        titleOwnerLabel.text = configuration.ownerName
        titleOwnerJobTitleLabel.text = configuration.ownerJobTitle
        ownerImageView.image = configuration.onwerImage
    }
}

extension OwnerView: ViewCode {
    
    func configureSubViews() {
        addSubview(mainStackView)
        
        ownerInformationStackView.addArrangedSubview(titleOwnerLabel)
        ownerInformationStackView.addArrangedSubview(titleOwnerNameLabel)
        ownerInformationStackView.addArrangedSubview(titleOwnerJobTitleLabel)
        
        ownerProfileStackView.addArrangedSubview(ownerInformationStackView)
        ownerProfileStackView.addArrangedSubview(ownerImageView)
        
        mainStackView.addArrangedSubview(ownerProfileStackView)
        mainStackView.addArrangedSubview(ownerProfileButton)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            mainStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            mainStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            ownerImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            ownerImageView.widthAnchor.constraint(equalToConstant: profileImageHeight),
            ownerImageView.heightAnchor.constraint(equalTo: ownerImageView.widthAnchor),
            ownerProfileButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configureAdditionalBehaviors() {
        backgroundColor = .white
        ownerImageView.layer.cornerRadius = profileImageHeight / 2
        ownerProfileButton.layer.cornerRadius = 8
    }
}

