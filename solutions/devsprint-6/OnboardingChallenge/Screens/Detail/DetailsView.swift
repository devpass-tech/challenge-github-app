//
//  DetailsView.swift
//  OnboardingChallenge
//
//  Created by Pedro Gabriel on 17/11/21.
//

import UIKit

final class DetailsView: UIView {
    // MARK: Components
    private lazy var ownerView: OwnerView = {
        let ownerView = OwnerView()
        ownerView.translatesAutoresizingMaskIntoConstraints = false
        return ownerView
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
        ownerView.updateView(with: OwnerViewConfiguration(ownerName: "Finn",
                                                          ownerJobTitle: "iOS Software Engineer",
                                                          onwerImage: UIImage(named: "finn")))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailsView: ViewCode {
    func configureSubViews() {
        addSubview(ownerView)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            self.ownerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.ownerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.ownerView.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    func configureAdditionalBehaviors() {
        backgroundColor = .white
    }
}
