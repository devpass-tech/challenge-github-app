//
//  ViewCode.swift
//  OnboardingChallenge
//
//  Created by Gustavo Soares on 09/11/21.
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
