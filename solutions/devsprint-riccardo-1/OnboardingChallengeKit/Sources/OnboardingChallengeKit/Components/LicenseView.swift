// Copyright © 2021 DevPass. All rights reserved.

import UIKit

class LicenseView: UIView {
  // MARK: Configuration

  struct Configuration {
    let license: String
    let abbreviation: String
    var buttonAction: (() -> Void)?
  }

  // MARK: Properties

  // MARK: UIComponents

  var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 8
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()

  var labelLicense: UILabel = {
    let label = UILabel()
    label.text = "License"
    label.font = .systemFont(ofSize: 28, weight: .bold)
    return label
  }()

  var labelType: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 16)
    return label
  }()

  var labelTypeAbbreviated: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 13)
    label.textColor = .systemGray
    return label
  }()

  var buttonLicense: ButtonView = {
    var buttonView = ButtonView()
    buttonView.translatesAutoresizingMaskIntoConstraints = false
    return buttonView
  }()

  // MARK: Initializers

  init() {
    super.init(frame: .zero)
    configureSubviews()
    configureSubviewsConstraints()
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Methods

  func updateView(with configuration: LicenseView.Configuration) {
    self.labelType.text = configuration.license
    self.labelTypeAbbreviated.text = configuration.abbreviation
    self.buttonLicense.configure(with: .init(title: "See License", pressedButton: configuration.buttonAction))
  }
}

// MARK: ViewCode Extensions

extension LicenseView {
  func configureSubviews() {
    addSubview(self.stackView)
    self.stackView.addArrangedSubview(self.labelLicense)
    self.stackView.addArrangedSubview(self.labelType)
    self.stackView.addArrangedSubview(self.labelTypeAbbreviated)
    addSubview(self.buttonLicense)
  }

  func configureSubviewsConstraints() {
    NSLayoutConstraint.activate([
      self.stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      self.stackView.leadingAnchor.constraint(equalTo: readableContentGuide.leadingAnchor),
      self.stackView.trailingAnchor.constraint(equalTo: readableContentGuide.trailingAnchor),
      self.buttonLicense.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 15),
      self.buttonLicense.leadingAnchor.constraint(equalTo: readableContentGuide.leadingAnchor),
      self.buttonLicense.trailingAnchor.constraint(equalTo: readableContentGuide.trailingAnchor),
      self.buttonLicense.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
    ])
  }
}

#if canImport(SwiftUI) && DEBUG
  import SwiftUI

  struct LicenseViewPreview: PreviewProvider {
    static var previews: some View {
      return SwiftUIPreView { _ in
        let config: LicenseView.Configuration = .init(
          license: "GNU General Public Licence v2.0",
          abbreviation: "GPL-2.0",
          buttonAction: { print("handle license action") }
        )
        let view = LicenseView()
        view.updateView(with: config)
        return view
      }
      .frame(width: UIScreen.main.bounds.width, height: 220)
    }
  }
#endif
