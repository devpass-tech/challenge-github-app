//
//  OwnerView.swift
//  GitHubApp
//
//  Created by Vitor Conceicao on 08/07/22.
//

import UIKit

final class OwnerView: UIView {
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 25, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let subtitleLabel = UILabel()
        subtitleLabel.font = .systemFont(ofSize: 17)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return subtitleLabel
    }()
    
    private lazy var additionalLabel: UILabel = {
        let additionalLabel = UILabel()
        additionalLabel.font = .systemFont(ofSize: 15)
        additionalLabel.textColor = .gray
        additionalLabel.translatesAutoresizingMaskIntoConstraints = false
        return additionalLabel
    }()
    
    private lazy var image: UIImageView = {
        let ownerImageView = UIImageView()
        return ownerImageView
    }()
    
    private lazy var button: UIButton = {
        let profileButton = UIButton(configuration: .filled())
        profileButton.setTitle("See profile", for: .normal)
        return profileButton
    }()
    
    
    
    // MARK: methods
    
    func updateView() {
        
    }
}

extension OwnerView: ViewCode {
    func setupSubviews() {}
    
    func setupConstraint() {}
    
    func setupExtraConfiguration() {}
}
