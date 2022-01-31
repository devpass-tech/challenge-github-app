//
//  ViewCode.swift
//  GitHubApp
//
//  Created by Pedro Francisco Tres on 27/01/22.
//

import Foundation

protocol ViewCode {
    func configureSubViews()
    func configureSubviewsConstraints()
    func configureAdditionalBehaviors()
}

extension ViewCode {
    public func setupViews() {
        configureSubViews()
        configureSubviewsConstraints()
        configureAdditionalBehaviors()
    }
}
