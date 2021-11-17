//
//  OwnerView.swift
//  OnboardingChallenge
//
//  Created by Gustavo Soares on 16/11/21.
//

import UIKit

struct OwnerViewConfiguration {
    var ownerName: String
    var ownerJobTitle: String
    var onwerImage: UIImage?
}

final class OwnerView: UIView {
    
    private lazy var titleOwnerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.tintColor = .black
        label.text = "Owner"
        return label
    }()
    
    private lazy var titleOwnerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.tintColor = .black
        return label
    }()
    
    private lazy var titleOwnerJobTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.tintColor = .systemGray
        return label
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    func updateView(with configuration: OwnerViewConfiguration) {
    }
    
}

extension OwnerView: ViewCode {
    
    func configureSubViews() {
        addSubview(titleOwnerLabel)
        addSubview(titleOwnerNameLabel)
        addSubview(titleOwnerJobTitleLabel)
    }
    
    func configureSubviewsConstraints() {
        
    }
    
    func configureAdditionalBehaviors() {
        
    }
}

