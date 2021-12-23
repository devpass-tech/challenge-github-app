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
      self.name.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor),
      self.name.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor),
      self.name.centerYAnchor.constraint(equalTo: self.centerYAnchor),
    ])
  }
}
