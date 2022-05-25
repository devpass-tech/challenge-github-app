//
//  ViewCode.swift
//  GitHubApp
//
//  Created by Thyago Raphael on 25/05/22.
//

import Foundation

protocol Viewcode {
    func buildHierarchy()
    func setupConstraints()
    func setupExtraConfiguration()
}

extension Viewcode {
    func setupViewCode() {
        buildHierarchy()
        setupConstraints()
        setupExtraConfiguration()
    }

    func setupExtraConfiguration() { }
}
