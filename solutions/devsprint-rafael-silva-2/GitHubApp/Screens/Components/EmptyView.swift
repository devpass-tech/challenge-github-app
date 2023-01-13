//
//  EmptyView.swift
//  GitHubApp
//
//  Created by Geovane Irlanda on 10/01/23.
//

import Foundation
import UIKit

struct EmptyViewConfiguration {
    let title: String
    let subTitle: String
}

final class EmptyView: UIView {
    
    private let emptyStack: UIStackView = {
        let emptyStack = UIStackView()
        emptyStack.translatesAutoresizingMaskIntoConstraints = false
        emptyStack.axis = .vertical
        emptyStack.spacing = 15
        return emptyStack
    }()
    
    private let emptyTitle: UILabel = {
        let emptyTitle = UILabel()
        emptyTitle.translatesAutoresizingMaskIntoConstraints = false
        emptyTitle.font = UIFont.boldSystemFont(ofSize: 16.0)
        emptyTitle.textAlignment = .center
        return emptyTitle
    }()
    
    private let emptySub: UILabel = {
        let emptySub = UILabel()
        emptySub.translatesAutoresizingMaskIntoConstraints = false
        emptySub.font = UIFont(name: "SF Pro Text", size: 13.0)
        emptySub.textColor = UIColor(red: 142, green: 142, blue: 147)
        emptySub.textAlignment = .center
        emptySub.numberOfLines = 0
        return emptySub
    }()
    
    init() {
        
        super.init(frame: .zero)
        self.setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension EmptyView {
    
    func setupViews() {
        
        self.backgroundColor = .white

        self.configureSubviews()
        self.configureSubviewsConstraints()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func configureSubviews() {
        
        addSubview(emptyStack)
        emptyStack.addArrangedSubview(emptyTitle)
        emptyStack.addArrangedSubview(emptySub)
        
    }
    
    func configureSubviewsConstraints() {
        
        NSLayoutConstraint.activate([
            emptySub.topAnchor.constraint(equalTo: emptyTitle.bottomAnchor),
            emptySub.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 5),
            trailingAnchor.constraint(equalToSystemSpacingAfter: emptySub.trailingAnchor, multiplier: 5)
            
        ])
        
    }
    
}

extension EmptyView {
    func updateView(with configuration: EmptyViewConfiguration) {
        emptyTitle.text = configuration.title
        emptySub.text = configuration.subTitle
        
    }
}
