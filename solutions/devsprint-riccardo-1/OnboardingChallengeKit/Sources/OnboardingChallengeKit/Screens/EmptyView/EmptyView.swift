// Copyright © 2021 DevPass. All rights reserved.

import Foundation
import UIKit

struct EmptyViewConfiguration {
  let title: String
  let subtitle: String
}

class EmptyView: UIView {
  private let stackView: UIStackView = {
    var stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.spacing = 16
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()

  private let titleLabel: UILabel = {
    var title = UILabel()
    title.font = UIFont.boldSystemFont(ofSize: 18)
    title.textColor = .black
    title.textAlignment = .center
    title.numberOfLines = 0
    title.translatesAutoresizingMaskIntoConstraints = false
    return title
  }()

  private let subtitleLabel: UILabel = {
    var subtitleLabel = UILabel()
    subtitleLabel.font = UIFont.systemFont(ofSize: 16)
    subtitleLabel.textColor = UIColor.systemGray
    subtitleLabel.textAlignment = .center
    subtitleLabel.numberOfLines = 0
    subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
    return subtitleLabel
  }()

  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    self.setupView()
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func updateView(with configuration: EmptyViewConfiguration) {
    self.titleLabel.text = configuration.title
    self.subtitleLabel.text = configuration.subtitle
  }

  private func setupView() {
    backgroundColor = .white
    addSubview(self.stackView)
    self.stackView.addArrangedSubview(self.titleLabel)
    self.stackView.addArrangedSubview(self.subtitleLabel)
    self.setupConstraints()
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      self.stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
      self.stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
      self.stackView.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor),
      self.stackView.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor),
    ])
  }
}

#if DEBUG
  import SwiftUI
  // swiftlint:disable type_name
  struct EmptyView_Preview: PreviewProvider {
    static var previews: some View {
      return SwiftUIPreView { _ in
        let emptyView = EmptyView()
        emptyView
          .updateView(with: EmptyViewConfiguration(
            title: "No repositories found",
            subtitle: "Search for users to see their public repositories here"
          ))
        return emptyView
      }
    }
  }
  // swiftlint:enable type_name
#endif
