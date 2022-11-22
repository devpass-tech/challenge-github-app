//
//  ViewCodable.swift
//  GitHubApp
//
//  Created by Marcus Vinicius Seixas on 22/11/22.
//

import Foundation

public protocol ViewCodable {

    func buildHierarchy()

    func setupConstraints()

    func applyAdditionalChanges()
}

public extension ViewCodable {

    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }

    func buildHierarchy() {}

    func setupConstraints() {}

    func applyAdditionalChanges() {}
}
