//
//  OwnerView.swift
//  GitHubApp
//
//  Created by Elena Diniz on 2/16/22.
//

import UIKit

class OwnerView: UIView {
    
//  private lazy var ownerProfileStackView: UIStackView = {
//    let stackView = UIStackView(arrangedSubviews: [ownerTextStackView, ownerImageView])
//    stackView.axis = .horizontal
//    stackView.distribution = .fillProportionally
//    stackView.alignment = .bottom
//    stackView.translatesAutoresizingMaskIntoConstraints = false
//    return stackView
//  }()
//
//  private lazy var ownerTextStackView: UIStackView = {
//    let stackView = UIStackView(arrangedSubviews: [ownerTitleLabel, ownerNameLabel, ownerRoleLabel])
//    stackView.axis = .vertical
//    stackView.spacing = 8
//    stackView.distribution = .fillProportionally
//    stackView.translatesAutoresizingMaskIntoConstraints = false
//    return stackView
//  }()
//
//  private lazy var ownerImageView: UIImageView = {
//    let imageView = UIImageView()
//    imageView.layer.masksToBounds = true
//    imageView.layer.cornerRadius = 30
//    return imageView
//  }()
//
//  private lazy var ownerTitleLabel: UILabel = {
//    let label = UILabel()
//    label.text = "Owner"
//    label.font = .systemFont(ofSize: 26.0, weight: .bold)
//    label.translatesAutoresizingMaskIntoConstraints = false
//    return label
//  }()
//
//  private lazy var ownerNameLabel: UILabel = {
//    let label = UILabel()
//    label.translatesAutoresizingMaskIntoConstraints = false
//    return label
//  }()
//
//  private lazy var ownerRoleLabel: UILabel = {
//    let label = UILabel()
//    label.alpha = 0.5
//    label.font = .systemFont(ofSize: 14.0)
//    label.translatesAutoresizingMaskIntoConstraints = false
//    return label
//  }()
//
//  private lazy var mainStackView: UIStackView = {
//    let stackView = UIStackView(arrangedSubviews: [ownerProfileStackView])
//    stackView.axis = .vertical
//    stackView.spacing = 32
//    stackView.distribution = .fillProportionally
//    stackView.translatesAutoresizingMaskIntoConstraints = false
//    return stackView
//  }()
    
    private let mainStackView = UIStackView()
    private let profileStackView = UIStackView()
    private let textStackView = UIStackView()
    private let titleLabel = UILabel()
    private let nameLabel = UILabel()
    private let roleLabel = UILabel()
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}

private extension OwnerView {
    func configureSubviews() {
      addSubview(mainStackView)
    }
    
    func configureConstraints() {
      NSLayoutConstraint.activate([
        mainStackView.topAnchor.constraint(equalTo: topAnchor),
        mainStackView.bottomAnchor.constraint(equalTo: mainStackView.superview!.bottomAnchor),
        mainStackView.leadingAnchor.constraint(equalTo: mainStackView.superview!.leadingAnchor, constant: 16.0),
        mainStackView.trailingAnchor.constraint(equalTo: mainStackView.superview!.trailingAnchor, constant: -16.0),
        imageView.widthAnchor.constraint(equalToConstant: 60),
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
      ])
    }
    
    func configureMainStackView() {
        mainStackView.addArrangedSubview(profileStackView)
        mainStackView.axis = .vertical
        mainStackView.spacing = 32
        mainStackView.distribution = .fillProportionally
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureProfileStackView() {
        profileStackView.addArrangedSubview(textStackView)
        profileStackView.addArrangedSubview(imageView)
        profileStackView.axis = .horizontal
        profileStackView.distribution = .fillProportionally
        profileStackView.alignment = .bottom
        profileStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureTextStackView() {
        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(nameLabel)
        textStackView.addArrangedSubview(roleLabel)
        textStackView.axis = .vertical
        textStackView.spacing = 8
        textStackView.distribution = .fillProportionally
        textStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureTitleLabel() {
        titleLabel.text = "Owner"
        titleLabel.font = .systemFont(ofSize: 26.0, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureRoleLabel() {
        roleLabel.alpha = 0.5
        roleLabel.font = .systemFont(ofSize: 14.0)
        roleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureImageView() {
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 30
    }
    
    func updateView(with configuration: OwnerViewConfiguration) {
        nameLabel.text = configuration.name
        roleLabel.text = configuration.actualRole
        configureImageView(configuration.profileImage)
    }
    
    func configureImageView(_ image: String) {
        let dataDecoded : Data = Data(base64Encoded: image, options: .ignoreUnknownCharacters)!
        let decodedImage = UIImage(data: dataDecoded)
        imageView.image = decodedImage
    }
    
}
