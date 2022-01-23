//
//  DetailView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 07/01/22.
//

import UIKit

final class DetailView: UIView {
  
  private lazy var mainStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [ownerView, UIView()])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.distribution = .equalCentering
    stackView.spacing = 0
    return stackView
  }()
  
  private lazy var ownerView: OwnerView = {
    let ownerView = OwnerView()
    ownerView.translatesAutoresizingMaskIntoConstraints = false
    return ownerView
  }()
  
  init() {
    super.init(frame: .zero)
    backgroundColor = .white
    setUpViews()
    setUpConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setUpViews() {
    addSubview(mainStackView)
    
    ownerView.updateView(with: .init(ownerName: "Giovanna", ownerRole: "Mobile Developer", ownerImage: UIImage(named: "random-user")))
  }
  
  private func setUpConstraints() {
    NSLayoutConstraint.activate([
      mainStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
      mainStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
      mainStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
      mainStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
    ])
  }
  
}
