//
//  DetailsView.swift
//  OnboardingChallenge
//
//  Created by Pedro Gabriel on 17/11/21.
//

import UIKit

final class DetailsView: UIView {
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailsView: ViewCode {
    func configureSubViews() { }
    
    func configureSubviewsConstraints() { }
    
    func configureAdditionalBehaviors() {
        backgroundColor = .white
    }
}
