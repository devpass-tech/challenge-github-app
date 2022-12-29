//
//  OwnerView.swift
//  GitHubApp
//
//  Created by Frédéric Helfer on 28/12/22.
//

import UIKit

struct OwnerViewConfiguration {
    let ownerTitle: String
    let ownerName: String
    let ownerBio: String
    let ownerImage: UIImage
}

class OwnerView: UIView {
    
    lazy var ownerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    lazy var ownerName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var ownerBio: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var ownerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 25
        image.image = UIImage(systemName: "person.fill")
        return image
    }()
    
    lazy var button: UIView = {
        let button = ButtonView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.updateView(with: ButtonView.ButtonViewConfiguration(buttonTitle: "See Profile"))
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension OwnerView {
    
    func setupViews() {
        
        configureSubviews()
        configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        addSubview(ownerTitle)
        addSubview(ownerName)
        addSubview(ownerBio)
        addSubview(ownerImage)
        addSubview(button)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
        
            ownerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            ownerTitle.topAnchor.constraint(equalTo: topAnchor, constant: 21),
            ownerTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            
            ownerName.leadingAnchor.constraint(equalTo: ownerTitle.leadingAnchor),
            ownerName.trailingAnchor.constraint(equalTo: ownerTitle.trailingAnchor),
            ownerName.topAnchor.constraint(equalTo: ownerTitle.bottomAnchor, constant: 9),
            
            ownerBio.leadingAnchor.constraint(equalTo: ownerTitle.leadingAnchor),
            ownerBio.trailingAnchor.constraint(equalTo: ownerTitle.trailingAnchor),
            ownerBio.topAnchor.constraint(equalTo: ownerName.bottomAnchor, constant: 9),
            
            button.leadingAnchor.constraint(equalTo: ownerTitle.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: ownerTitle.trailingAnchor),
            button.topAnchor.constraint(equalTo: ownerBio.bottomAnchor, constant: 21),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 23.5),
            button.heightAnchor.constraint(equalToConstant: 56),
            
            ownerImage.bottomAnchor.constraint(equalTo: button.topAnchor, constant: 22),
            ownerBio.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            ownerImage.heightAnchor.constraint(equalToConstant: 45),
            ownerImage.widthAnchor.constraint(equalToConstant: 45),
            
        ])
    }
}

extension OwnerView {
    
    public func updateView(with configuration: OwnerViewConfiguration) {
        self.ownerTitle.text = configuration.ownerTitle
        self.ownerName.text = configuration.ownerName
        self.ownerBio.text = configuration.ownerBio
        self.ownerImage.image = configuration.ownerImage
    }
    
}
