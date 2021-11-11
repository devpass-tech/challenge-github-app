//
//  LoadingView.swift
//  OnboardingChallenge
//
//  Created by Karina Martins Silva on 09/11/21.
//

import Foundation
import UIKit

struct LoadingViewConfiguration {
    var title: String
}

final class LoadingView: UIView {
    
    private var searching: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints =  false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private var loadIndicator: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView(style: .large)
        loading.translatesAutoresizingMaskIntoConstraints = false 
        loading.startAnimating()
        return loading
    }()
    
    init() {
        super.init(frame: .zero)
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviews() {
        self.backgroundColor = .white
        self.addSubview(self.searching)
        self.addSubview(self.loadIndicator)
    }
    
    func configureConstraints() {
        searching.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        searching.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        loadIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loadIndicator.topAnchor.constraint(equalTo: searching.bottomAnchor, constant: 16).isActive = true
    }
    
    func updateView(configuration: LoadingViewConfiguration) {
        searching.text = configuration.title
    }
}
