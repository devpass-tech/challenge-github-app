//
//  EmptyView.swift
//  GitHubApp
//
//  Created by Emanuel Hespanhol Costa on 18/01/22.
//

import UIKit

protocol CodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension CodeView {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}

struct EmptyViewConfiguration {
    var labelText: String
    var labelText2: String
}

final class EmptyView: UIView {

    private var titleLabel: UILabel = {
        let label1 = UILabel()
        label1.text = "No repositories found"
        label1.font = UIFont.boldSystemFont(ofSize: 20)
        label1.tintColor = .darkGray
        label1.autoresizesSubviews = true
        label1.translatesAutoresizingMaskIntoConstraints = false
        return label1
    }()
    
    private var subtitleLabel: UILabel = {
        let label2 = UILabel()
        label2.text = "Search for users to see their public repositories here!"
        label2.font = UIFont.systemFont(ofSize: 14)
        label2.tintColor = .gray
        label2.autoresizesSubviews = true
        label2.translatesAutoresizingMaskIntoConstraints = false
        return label2
    }()
    
    override init(frame: CGRect = .zero){
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EmptyView: CodeView {
    func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    func setupConstraints() {
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        subtitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
    
    func updateView(with configuration: EmptyViewConfiguration) {
        titleLabel.text = configuration.labelText
        subtitleLabel.text = configuration.labelText2
    }
    
}
