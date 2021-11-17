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
    
    private var stackOwnerView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var titleOwnerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Owner"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var titleOwnerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Gustavo Soares"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var titleOwnerJobTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "Senior Software Engineer"
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(stackOwnerView)
        stackOwnerView.addArrangedSubview(titleOwnerLabel)
        stackOwnerView.addArrangedSubview(titleOwnerNameLabel)
        stackOwnerView.addArrangedSubview(titleOwnerJobTitleLabel)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            stackOwnerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            stackOwnerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            stackOwnerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
    }
    
    func configureAdditionalBehaviors() {
        backgroundColor = .white
    }
}

