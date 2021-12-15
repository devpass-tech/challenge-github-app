//
//  ViewCode.swift
//  OnboardingChallenge
//
//  Created by Pedro Gabriel on 15/12/21.
//

import UIKit

protocol ViewCode where Self: UIView {
    func configureSubviews()
    func configureSubviewsConstraints()
    func configureAdditionalBehaviors()
}

extension ViewCode {
    public func setupViews() {
        configureSubviews()
        configureSubviewsConstraints()
        configureAdditionalBehaviors()
    }
}
