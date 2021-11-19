//
//  LicenseView.swift
//  OnboardingChallenge
//
//  Created by Guilherme Strutzki on 19/11/21.
//

import Foundation
import UIKit

struct LicenseViewModel {
    var licenseName: String;
    var description: String;
}

final class LicenseView: UIView {
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.text = "License"
       return label
    }()
    
    private var licenseNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private var button: UIButton = {
       let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("See license", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel,
                                                   licenseNameLabel,
                                                   descriptionLabel,
                                                   button
                                                  ])
        stack.axis = .vertical
        stack.spacing = 15
        stack.setCustomSpacing(30, after: descriptionLabel)
         return stack
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with configuration: LicenseViewModel) {
        licenseNameLabel.text = configuration.licenseName
        descriptionLabel.text = configuration.description
    }
}

extension LicenseView: ViewCode {
    func buildViewHierarchy() {
        addSubview(containerStackView)
    }
    
    func addConstraints() {
        containerStackView.anchor(top: topAnchor,
                                  leading: leadingAnchor,
                                  bottom: nil,
                                  trailing: trailingAnchor,
                                  padding: UIEdgeInsets(top: 0,
                                                        left: 20,
                                                        bottom: 0,
                                                        right: 20))
        button.anchor(top: nil,
                      leading: leadingAnchor,
                      bottom: nil,
                      trailing: trailingAnchor,
                      padding: UIEdgeInsets(top: 0,
                                            left: 20,
                                            bottom: 0,
                                            right: 20),
                      size: CGSize(width: 0, height: 50))
    }
    
    func additionalConfiguration() {}
}
