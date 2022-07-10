//
//  ViewCode.swift
//  GitHubApp
//
//  Created by Vitor Conceicao on 06/07/22.
//

import Foundation

protocol ViewCode {
    func setupSubviews()
    func setupConstraint()
    func setupExtraConfiguration()
    func setup()
}

extension ViewCode {
    func setup() {
        setupSubviews()
        setupConstraint()
        setupExtraConfiguration()
    }
}
