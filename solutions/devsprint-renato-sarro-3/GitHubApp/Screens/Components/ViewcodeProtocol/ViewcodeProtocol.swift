//
//  ViewcodeProtocol.swift
//  GitHubApp
//
//  Created by Thyago Raphael on 23/05/22.
//

import Foundation

protocol ViewCode {
    func buildHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewCode {
    func setupViewCode() {
        buildHierarchy()
        setupConstraints()
        configureViews()
    }

    func configureViews() { }
}
