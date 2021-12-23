// Copyright © 2021 DevPass. All rights reserved.

import UIKit

class RepositoryCellView: UITableViewCell {
  // MARK: Properties

  static let reuseIdentifier = "RepositoryCellView"

  // MARK: Outlets

  private lazy var labelRepositoryName: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private lazy var labelRepositoryOwnerName: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14)
    label.textColor = .systemGray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  // MARK: Initialization

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.setupViews()
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Methods

  func updateView(with configuration: RepositoryCellViewConfiguration) {
    self.labelRepositoryName.text = configuration.repositoryName
    self.labelRepositoryOwnerName.text = configuration.repositoryOwnerName
  }

  func setupViews() {
    self.configureSubViews()
    self.configureConstraints()
    self.configureCellStyle()
  }

  func configureSubViews() {
    contentView.addSubview(self.labelRepositoryName)
    contentView.addSubview(self.labelRepositoryOwnerName)
  }

  func configureConstraints() {
    NSLayoutConstraint.activate([
      self.labelRepositoryName.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      self.labelRepositoryName.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor, constant: 15),
      self.labelRepositoryOwnerName.topAnchor.constraint(equalTo: self.labelRepositoryName.topAnchor, constant: 25),
      self.labelRepositoryOwnerName.leadingAnchor.constraint(equalTo: self.labelRepositoryName.leadingAnchor),
    ])
  }

  func configureCellStyle() {
    selectionStyle = .none
    accessoryType = .disclosureIndicator
  }
}

#if DEBUG
  import SwiftUI
  // swiftlint:disable type_name
  struct RepositoryCellView_Preview: PreviewProvider {
    static var previews: some View {
      return SwiftUIPreView { _ in
        let rcv = RepositoryCellView()
        rcv
          .updateView(with: RepositoryCellViewConfiguration(
            repositoryName: "hereminders-ios",
            repositoryOwnerName: "rdgborges"
          ))
        return rcv
      }
    }
  }
  // swiftlint:enable type_name
#endif
