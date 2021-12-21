// Copyright © 2021 DevPass. All rights reserved.

import Foundation
import UIKit

struct LoadingViewConfiguration {
  let title: String
}

class LoadingView: UIView {
  private let stackView: UIStackView = {
    var stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.spacing = 16
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()

  private let titleLabel: UILabel = {
    let title = UILabel()
    title.font = UIFont.boldSystemFont(ofSize: 18)
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
    addSubview(self.stackView)
    self.stackView.addArrangedSubview(self.titleLabel)
    self.stackView.addArrangedSubview(self.activityIndicator)
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
  struct LoadingView_Preview: PreviewProvider {
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
