// Copyright © 2021 Bending Spoons S.p.A. All rights reserved.

import UIKit

class SettingsCell: UITableViewCell {
  static let Identifier = "\(SettingsCell.self)"

  private lazy var name: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 14, weight: .light)
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    customizeInterface()
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func updateView(with viewModel: String) {
    self.name.text = viewModel
  }
}

extension SettingsCell {
  private func customizeInterface() {
    self.configureSubviews()
    self.configureSubviewsConstraints()
  }

  private func configureSubviews() {
    self.contentView.addSubview(self.name)
  }

  private func configureSubviewsConstraints() {
    NSLayoutConstraint.activate([
      self.name.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
      self.name.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 15),
      self.name.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
      self.name.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5),
    ])
  }
}
