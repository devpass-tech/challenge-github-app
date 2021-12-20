//
//  LicenseView.swift
//  OnboardingChallenge
//
//  Created by Pedro Gabriel on 20/12/21.
//

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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var labelType: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var labelTypeAbbreviated: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
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

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Methods

    func updateView(with configuration: LicenseView.Configuration) {
        labelType.text = configuration.license
        labelTypeAbbreviated.text = configuration.abbreviation
        buttonLicense.configure(with: .init(title: "See License", pressedButton: configuration.buttonAction))
    }
}

// MARK: ViewCode Extensions

extension LicenseView {

    func configureSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(labelLicense)
        stackView.addArrangedSubview(labelType)
        stackView.addArrangedSubview(labelTypeAbbreviated)
        addSubview(buttonLicense)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            buttonLicense.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 15),
            buttonLicense.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            buttonLicense.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            buttonLicense.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)])
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct LicenseViewPreview: PreviewProvider {

    static var previews: some View {
        return SwiftUIPreView { context in
            let config: LicenseView.Configuration = .init(license: "GNU General Public Licence v2.0",
                                                          abbreviation: "GPL-2.0",
                                                          buttonAction: { print("handle license action") })
            let view = LicenseView()
            view.updateView(with: config)
            return view
        }
        .frame(width: UIScreen.main.bounds.width, height: 220)
    }
}
#endif
