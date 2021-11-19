//
//  DetailView.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Francischett Occhiuto on 09/11/21.
//

import Foundation
import UIKit

class DetailView: UIView {

    private var repositoryStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    
    private var repositoryInfoView: RepositoryInfoView = {
        let repositoryInfoView = RepositoryInfoView()
        repositoryInfoView.translatesAutoresizingMaskIntoConstraints = false
        repositoryInfoView.updateView(with: RepositoryInfoViewConfiguration(repositoryName: "hereminders-ios", description: "O Hereminders é um app de lembretes geolocalizados, implementado em Swift com a arquitetura MVVM-C.", starNumber: 5, bifurcations: 17))
        return repositoryInfoView
    }()
    
    private var ownerView: OwnerView = {
        let ownerView = OwnerView()
        ownerView.translatesAutoresizingMaskIntoConstraints = false
        ownerView.updateView(with: OwnerViewConfiguration(title: "Owner", account: "Rodrigo Borges", bio: "Mobile Tech Lead", image: UIImage(named: "user-profile")!))
        return ownerView
    }()

    private var licenseView: UIView = {
        let licenseView = LicenseView()
        licenseView.translatesAutoresizingMaskIntoConstraints = false
        licenseView.updateView(with: LicenseViewModel(licenseName: "MIT", description: "GPL-2.0"))
        return licenseView
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
        addSubview(repositoryStack)
        repositoryStack.addArrangedSubview(repositoryInfoView)
        repositoryStack.addArrangedSubview(ownerView)
        repositoryStack.addArrangedSubview(licenseView)
    }
    
    func addConstraints() {
        repositoryStack.anchor(top: safeAreaLayoutGuide.topAnchor,
                               leading: leadingAnchor,
                               bottom: nil,
                               trailing: trailingAnchor)

        repositoryInfoView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        ownerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        licenseView.heightAnchor.constraint(equalToConstant: 300).isActive = true

    }
    
    func additionalConfiguration() {
        backgroundColor = .white
    }
}

