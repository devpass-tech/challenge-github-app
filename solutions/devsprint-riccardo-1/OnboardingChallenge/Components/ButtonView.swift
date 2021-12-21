// Copyright © 2021 DevPass. All rights reserved.

import UIKit

struct ButtonViewConfiguration {
  let title: String
  var pressedButton: (() -> Void)?
}

class ButtonView: UIView {
  // MARK: Properties

  private var pressedButton: (() -> Void)?

  private lazy var button: UIButton = {
    var button = UIButton(type: .system)

    button.layer.cornerRadius = 15
    button.backgroundColor = .systemBlue
    button.titleLabel?.tintColor = .white
    button.titleLabel?.font = .systemFont(ofSize: 21, weight: .semibold)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(equalToConstant: 80).isActive = true

    button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    return button
  }()

  // MARK: Initializers

  init() {
    super.init(frame: .zero)
    configureSubviews()
    configureSubviewsConstraints()
    configureAdditionalBehaviors()
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Overrides

  override var intrinsicContentSize: CGSize {
    return self.button.intrinsicContentSize
  }

  // MARK: Actions

  @objc
  private func buttonPressed() {
    self.pressedButton?()
  }

  // MARK: Methods

  func configure(with configuration: ButtonViewConfiguration) {
    self.pressedButton = configuration.pressedButton
    self.button.setTitle(configuration.title, for: .normal)
  }
}

// MARK: ViewCode Extensions

extension ButtonView {
  func configureSubviews() {
    addSubview(self.button)
  }

  func configureSubviewsConstraints() {
    NSLayoutConstraint.activate([
      self.button.topAnchor.constraint(equalTo: topAnchor),
      self.button.leadingAnchor.constraint(equalTo: leadingAnchor),
      self.button.trailingAnchor.constraint(equalTo: trailingAnchor),
      self.button.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }

  func configureAdditionalBehaviors() {}
}

// MARK: Preview

#if DEBUG
  import SwiftUI
  // swiftlint:disable type_name
  struct ButtonView_Preview: PreviewProvider {
    static var previews: some View {
      return SwiftUIPreView { _ in
        let config = ButtonViewConfiguration(title: "Some button") {
          print("do something")
        }
        let view = ButtonView()
        view.configure(with: config)
        return view
      }
      .padding()
      .frame(width: .infinity, height: 80)
    }
  }
  // swiftlint:enable type_name
#endif
