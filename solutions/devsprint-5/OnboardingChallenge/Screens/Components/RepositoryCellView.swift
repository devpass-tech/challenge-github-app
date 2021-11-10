//
//  RepositoryCellView.swift
//  OnboardingChallenge
//
//  Created by Guilherme Strutzki on 10/11/21.
//

import Foundation
import UIKit

final class RepositoryCellView: UITableViewCell {
    static var identifier: String {
        String(describing: self)
    }
    
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
    
    private var leftArrowImage: UIImageView = {
        let image = UIImage(systemName: "chevron.right")
        let imageView = UIImageView(image: image)
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, ownerUsernameLabel])
         stack.axis = .vertical
         stack.spacing = 5
         
         return stack
    }()
    
    private lazy var containerStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelStackView, leftArrowImage])
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        addSubview(containerStack)
    }
    
    func addConstraints() {
        containerStack.fillSuperview(padding: UIEdgeInsets(top: 15,
                                                           left: 15,
                                                           bottom: 15,
                                                           right: 15))
        leftArrowImage.constrainWidth(40)
        
    }
    
    func additionalConfiguration() {}
}
