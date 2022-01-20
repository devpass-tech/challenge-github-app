//
//  LicenseView.swift
//  GitHubApp
//
//  Created by Rodrigo Leme on 18/01/22.
//

import Foundation
import UIKit

struct LicenseViewConfiguration {
    let licenseTitle: String?
    let licenseName: String?
    let licenseCode: String?
}

final class LicenseView: UIView {
    private lazy var licenseTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 26.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var licenseName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var licenseCode: UILabel = {
        let label = UILabel()
        label.alpha = 0.5
        label.font = .systemFont(ofSize: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var liceseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See License", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 18.0, weight: .semibold)
        button.layer.cornerRadius = 16
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [licenseTitle, licenseName, licenseCode, liceseButton])
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupViews() {
        addSubview(stackView)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: UIEdgeInsets.zero.top),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            liceseButton.heightAnchor.constraint(equalToConstant: 64.0)
        ])

    }
    
    
    
    func updateView(with configuration: LicenseViewConfiguration) {
        if let title = configuration.licenseTitle {
            licenseTitle.text = title
        }
        
        if let name = configuration.licenseName {
            licenseName.text = name
        }
        
        if let code = configuration.licenseCode {
            licenseCode.text = code
        }
    }
}
