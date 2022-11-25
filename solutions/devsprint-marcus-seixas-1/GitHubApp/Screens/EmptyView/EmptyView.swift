//
//  EmptyView.swift
//  GitHubApp
//
//  Created by Marcus Vinicius Seixas on 22/11/22

import UIKit

struct EmptyViewConfiguration {
    var labelText: String
    var labelText2: String
}

final class EmptyView: UIView {

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.tintColor = .darkGray
        label.autoresizesSubviews = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "tituloPadrao"
        return label
    }()
    
    private var subtitleLabel: UILabel = {
        let label2 = UILabel()
        label2.font = UIFont.systemFont(ofSize: 14)
        label2.tintColor = .gray
        label2.autoresizesSubviews = true
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.text = "subtituloPadrao"
        return label2
    }()
    
    override init(frame: CGRect = .zero){
        super.init(frame: frame)
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EmptyView: ViewCodable {
    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    func setupConstraints() {
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        subtitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
    }
    
    func applyAdditionalChanges() {
        self.backgroundColor = .white
    }
    
    func updateView(with configuration: EmptyViewConfiguration) {
        titleLabel.text = configuration.labelText
        subtitleLabel.text = configuration.labelText2
    }
}
