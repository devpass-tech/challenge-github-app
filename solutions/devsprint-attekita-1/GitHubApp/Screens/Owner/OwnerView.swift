//
//  OwnerView.swift
//  GitHubApp
//
//  Created by Giovanna Moeller on 19/01/22.
//

import UIKit

struct OwnerViewConfiguration {
  let ownerName: String
  let ownerRole: String
  let ownerImage: UIImage?
}

class OwnerView: UIView {
  
  private lazy var ownerProfileStackView: UIStackView = {
    // This stack view contains text + image view
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.distribution = .fillProportionally
    stackView.alignment = .bottom
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  private lazy var ownerTextStackView: UIStackView = {
    // This stack view contains the owner's informations
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 0
    stackView.distribution = .fillProportionally
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  private lazy var ownerImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "random-user")!
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
    label.text = "John Doe"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var ownerRoleLabel: UILabel = {
    let label = UILabel()
    label.text = "Mobile Tech Lead"
    label.alpha = 0.5
    label.font = .systemFont(ofSize: 14.0)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var button: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .systemBlue
    button.setTitle("See Profile", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 18.0, weight: .semibold)
    button.layer.cornerRadius = 16
    button.tintColor = .white
    return button
  }()
  
  private lazy var mainStackView: UIStackView = {
    // This stack view contains ownerProfileStackView + Button
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 32
    stackView.distribution = .fillProportionally
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    configureSubviews()
    configureConstraints()
  }
  
  private func configureSubviews() {
    
    addSubview(mainStackView)
    
    [ownerTitleLabel, ownerNameLabel, ownerRoleLabel].forEach { (view: UILabel) in
      ownerTextStackView.addArrangedSubview(view)
    }
    
    [ownerTextStackView, ownerImageView].forEach { (view: UIView) in
      ownerProfileStackView.addArrangedSubview(view)
    }
    
    [ownerProfileStackView, button].forEach { (view: UIView) in
      mainStackView.addArrangedSubview(view)
    }
    
    //ownerTextStackView.backgroundColor = .systemPink
    //ownerProfileStackView.backgroundColor = .blue
    //mainStackView.backgroundColor = .yellow
    
  }
  
  private func configureConstraints() {
    NSLayoutConstraint.activate([
      mainStackView.centerXAnchor.constraint(
        equalTo: safeAreaLayoutGuide.centerXAnchor),
      mainStackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
      mainStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
      mainStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
      
      button.heightAnchor.constraint(equalToConstant: 64.0),
      
      ownerTitleLabel.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 16.0),
      
      ownerNameLabel.bottomAnchor.constraint(equalTo: ownerRoleLabel.topAnchor, constant: -4),
      
      
      ownerImageView.widthAnchor.constraint(equalToConstant: 60),
      ownerImageView.heightAnchor.constraint(equalTo: ownerImageView.widthAnchor),
      
    ])
    
  }
  
  func updateView(with configuration: OwnerViewConfiguration) {
    ownerNameLabel.text = configuration.ownerName
    ownerRoleLabel.text = configuration.ownerRole
    ownerImageView.image = configuration.ownerImage
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
