//
//  OwnerView.swift
//  GitHubApp
//
//  Created by Giovanna Moeller on 19/01/22.
//

import UIKit
import Kingfisher

struct OwnerViewConfiguration {
  let ownerName: String
  let ownerRole: String
  let ownerImage: String
}

final class OwnerView: UIView {
    
  private lazy var ownerProfileStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [ownerTextStackView, ownerImageView])
    stackView.axis = .horizontal
    stackView.distribution = .fillProportionally
    stackView.alignment = .bottom
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  private lazy var ownerTextStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [ownerTitleLabel, ownerNameLabel, ownerRoleLabel])
    stackView.axis = .vertical
    stackView.spacing = 0
    stackView.distribution = .fillProportionally
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  private lazy var ownerImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.masksToBounds = true
    imageView.layer.cornerRadius = 30
    return imageView
  }()
  
  private lazy var ownerTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "Owner"
    label.font = .systemFont(ofSize: 26.0, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var ownerNameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var ownerRoleLabel: UILabel = {
    let label = UILabel()
    label.alpha = 0.5
    label.font = .systemFont(ofSize: 14.0)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var mainStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [ownerProfileStackView])
    stackView.axis = .vertical
    stackView.spacing = 32
    stackView.distribution = .fillProportionally
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureSubviews()
    configureConstraints()
  }
  
  private func configureSubviews() {
    addSubview(mainStackView)
  }
  
  private func configureConstraints() {
    NSLayoutConstraint.activate([
      mainStackView.topAnchor.constraint(equalTo: mainStackView.superview!.topAnchor),
      mainStackView.bottomAnchor.constraint(equalTo: mainStackView.superview!.bottomAnchor),
      mainStackView.leadingAnchor.constraint(equalTo: mainStackView.superview!.leadingAnchor, constant: 16.0),
      mainStackView.trailingAnchor.constraint(equalTo: mainStackView.superview!.trailingAnchor, constant: -16.0),
      ownerTitleLabel.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 16.0),
      ownerNameLabel.bottomAnchor.constraint(equalTo: ownerRoleLabel.topAnchor, constant: -4),
      ownerImageView.widthAnchor.constraint(equalToConstant: 60),
      ownerImageView.heightAnchor.constraint(equalTo: ownerImageView.widthAnchor),
    ])
  }
  
  func updateView(with configuration: OwnerViewConfiguration) {
    ownerNameLabel.text = configuration.ownerName
    ownerRoleLabel.text = configuration.ownerRole
    configureImageView(configuration.ownerImage)
  }
  
  private func configureImageView(_ str: String) {
    let imageURL = URL(string: str)
    ownerImageView.kf.setImage(with: imageURL)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
