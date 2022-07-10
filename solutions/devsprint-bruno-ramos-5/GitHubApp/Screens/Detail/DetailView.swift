//
//  DetailView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 07/01/22.
//

import UIKit

final class DetailView: UIView {
    private lazy var ownerView: OwnerView = {
        let ownerView = OwnerView()
        ownerView.translatesAutoresizingMaskIntoConstraints = false
        return ownerView
    }()
    
    private lazy var licenseView: LicenseView = {
        let licenseView = LicenseView()
        licenseView.translatesAutoresizingMaskIntoConstraints = false
        return licenseView
    }()
}

extension DetailView: ViewCode {
    func setupSubviews() {
        addSubview(ownerView)
        addSubview(licenseView)
    }
    
    func setupConstraint() {}
    
    func setupExtraConfiguration() {}
    
    
}
