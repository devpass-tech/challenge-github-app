//
//  RepositoryCellView.swift
//  GitHubApp
//
//  Created by Pierre Youness on 26/07/2022.
//

import UIKit

struct RepositoryCellVM {
  let name: String
  let owner:  String
}

class RepositoryCellView: UITableViewCell {
  
  static let cellIdentifier = "ListViewCellIdentifier"
  
  private let lblRepositoryName: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.boldSystemFont(ofSize: 15)
    label.textColor = .black
    return label
  }()
  
  private let lblOwner: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 13)
    label.textColor = UIColor.init(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6)
    return label
  }()
  
  private let sv: UIStackView = {
    let sv = UIStackView()
    sv.translatesAutoresizingMaskIntoConstraints = false
    sv.axis = .vertical
    return sv
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupUI()
  }
  
  private func setupUI() {
    accessoryType = .disclosureIndicator
    
    sv.addArrangedSubview(lblRepositoryName)
    sv.addArrangedSubview(lblOwner)
    contentView.addSubview(sv)
    
    NSLayoutConstraint.activate([
      self.sv.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17),
      self.sv.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      self.sv.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
      self.sv.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -17)
    ])
  }
  
  func updateView(with configuration: RepositoryCellVM) {
    lblRepositoryName.text  = configuration.name
    lblOwner.text           = configuration.owner
  }
}
