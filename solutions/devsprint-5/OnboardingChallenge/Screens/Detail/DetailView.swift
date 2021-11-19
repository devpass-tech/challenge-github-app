//
//  DetailView.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Francischett Occhiuto on 09/11/21.
//

import Foundation
import UIKit

class DetailView: UIView {
    private var repositoryInfoView: UIView = {
        let view = RepositoryInfoView()
        view.updateView(with: RepositoryInfoViewConfiguration(repositoryName: "Lorem Ipsum",
                                                              description: "A cool repositoy",
                                                              starNumber: 10,
                                                              bifurcations: 5))
        view.addBottomBorder(with: UIColor("cccccc", alpha: 0.4), andWidth: 0.5)
        return view
    }()

    
    private var licenseView: UIView = {
        let view = LicenseView()
        view.updateView(with: LicenseViewModel(licenseName: "MIT", description: "GPL-2.0"))
        return view
    }()
    
    private lazy var containerStackView: UIStackView = {
        // WIP: Missing RepositoryInfoView and OwnerView
        let stack = UIStackView(arrangedSubviews: [repositoryInfoView, licenseView])
        stack.axis = .vertical
        stack.spacing = 30
        stack.distribution = .fill
        return stack
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DetailView: ViewCode {
    func buildViewHierarchy() {
        addSubview(containerStackView)
    }
    
    func addConstraints() {
        containerStackView.anchor(top: safeAreaLayoutGuide.topAnchor,
                                  leading: leadingAnchor,
                                  bottom: safeAreaLayoutGuide.bottomAnchor,
                                  trailing: trailingAnchor)
    }
    
    func additionalConfiguration() {
        backgroundColor = .white
    }
}

