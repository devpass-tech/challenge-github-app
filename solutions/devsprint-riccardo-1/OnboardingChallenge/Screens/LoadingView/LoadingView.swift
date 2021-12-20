// Copyright © 2021 Bending Spoons S.p.A. All rights reserved.

import Foundation
import UIKit

struct LoadingViewConfiguration {
  let title: String
}

class LoadingView: UIView {
  private var titleLabel: UILabel = {
    let title = UILabel()
    title.font = UIFont.boldSystemFont(ofSize: 18)
    title.text = "Searching repositories..."
    title.textColor = .black
    title.textAlignment = .center
    title.numberOfLines = 0
    title.translatesAutoresizingMaskIntoConstraints = false
    return title
  }()

  private let activityIndicator: UIActivityIndicatorView = {
    let activityIndicator = UIActivityIndicatorView(style: .large)
    activityIndicator.startAnimating()
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    return activityIndicator
  }()

  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    self.setupView()
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func updateView(with configuration: LoadingViewConfiguration) {
    self.titleLabel.text = configuration.title
  }

  private func setupView() {
    backgroundColor = .white
    addSubview(self.titleLabel)
    addSubview(self.activityIndicator)
    self.setupConstraints()
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      self.titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      self.titleLabel.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor),
      self.titleLabel.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor),
      self.titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
    ])

    NSLayoutConstraint.activate([
      self.activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
      self.activityIndicator.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor),
      self.activityIndicator.trailingAnchor.constraint(equalTo: self.readableContentGuide.trailingAnchor),
      self.activityIndicator.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16),
    ])
  }
}

#if DEBUG
  import SwiftUI
  // swiftlint:disable type_name
  struct EmptyView_Preview: PreviewProvider {
    static var previews: some View {
      return SwiftUIPreView { _ in
        let loadingView = LoadingView()
        loadingView
          .updateView(with: LoadingViewConfiguration(
            title: "Searching all kind of repositories and adding a superlong title here with multiple lines for testing purposes"
          ))
        return loadingView
      }
    }
  }
  // swiftlint:enable type_name
#endif
