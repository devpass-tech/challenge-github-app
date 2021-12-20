// Copyright © 2021 Bending Spoons S.p.A. All rights reserved.

import Foundation
import UIKit

struct EmptyViewConfiguration {
  let title: String
  let subtitle: String
}

class EmptyView: UIView {
  private var titleLabel: UILabel = {
    var title = UILabel()
    title.font = UIFont.boldSystemFont(ofSize: 18)
    title.text = "No repositories found"
    title.textColor = .black
    title.textAlignment = .center
    title.numberOfLines = 0
    title.translatesAutoresizingMaskIntoConstraints = false
    return title
  }()

  private var subtitleLabel: UILabel = {
    var subtitleLabel = UILabel()
    subtitleLabel.font = UIFont.systemFont(ofSize: 16)
    subtitleLabel.text = "Search for users to see their public repositories here"
    subtitleLabel.textColor = .gray
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
    addSubview(self.titleLabel)
    addSubview(self.subtitleLabel)
    self.setupConstraints()
  }

  private func setupConstraints() {
    
    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
      titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
      titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
    ])
    
    NSLayoutConstraint.activate([
      subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
      subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
      subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16),
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
