//
//  RepositoryCellView.swift
//  OnboardingChallenge
//
//  Created by Guilherme Strutzki on 10/11/21.
//

import Foundation
import UIKit

final class RepositoryCellView: UITableViewCell {
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private var ownerUsernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, ownerUsernameLabel])
         stack.axis = .vertical
         stack.spacing = 5
         return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with configuration: RepositoryCellViewModel) {
        nameLabel.text = configuration.name
        ownerUsernameLabel.text = configuration.ownerUsername
    }
}

extension RepositoryCellView: ViewCode {
    func buildViewHierarchy() {
        addSubview(labelStackView)
    }
    
    func addConstraints() {
        labelStackView.fillSuperview(padding: UIEdgeInsets(top: 15,
                                                           left: 15,
                                                           bottom: 15,
                                                           right: 15))
    }
    
    func additionalConfiguration() {}
}
