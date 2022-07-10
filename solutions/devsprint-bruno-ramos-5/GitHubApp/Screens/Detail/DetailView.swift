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
}

extension DetailView: ViewCode {
    func setupSubviews() {
        addSubview(ownerView)
    }
    
    func setupConstraint() {}
    
    func setupExtraConfiguration() {}
    
    
}
