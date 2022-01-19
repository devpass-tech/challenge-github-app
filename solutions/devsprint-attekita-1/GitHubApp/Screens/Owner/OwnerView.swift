//
//  OwnerView.swift
//  GitHubApp
//
//  Created by Giovanna Moeller on 19/01/22.
//

import UIKit

class OwnerView: UIView {
  
  private lazy var ownerProfileStackView: UIStackView = {
    // This stack view contains text + image view
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.spacing = 24
    stackView.distribution = .fillProportionally
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  private lazy var ownerTextStackView: UIStackView = {
    // This stack view contains the owner's informations
    
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 8
    stackView.distribution = .fillEqually
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  private lazy var ownerImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "random-user")!)
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private lazy var ownerTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "Owner"
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
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var button: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("See Profile", for: .normal)
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureSubviews()
    
  }
  
  private func configureSubviews() {
    //addSubview(<#T##UIView#>)
    
    [ownerTitleLabel, ownerNameLabel, ownerRoleLabel].forEach { (view: UILabel) in
      ownerTextStackView.addArrangedSubview(view)
    }
    
    //addSubview(<#T##view: UIView##UIView#>)
  }
  
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
