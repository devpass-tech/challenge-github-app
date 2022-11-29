//
//  LoadingView.swift
//  GitHubApp
//
//  Created by Rafael Mazzoco on 29/11/22.
//

import UIKit

struct LoadingViewConfiguration {
    var labelText: String
}

final class LoadingView: UIView {
        
    private lazy var loadingLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.autoresizesSubviews = true
        label.backgroundColor = .white
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Searching Repositories..."
        return label
    }()
    
    private lazy var loaderIndicator : UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .medium)
        loader.translatesAutoresizingMaskIntoConstraints = false
        // loader.hidesWhenStopped = true
        loader.startAnimating()
        return loader
    }()
    
    private func setUpConstraints() {
        
        addSubview(loadingLabel)
        loadingLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        loadingLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        addSubview(loaderIndicator)
        
        loaderIndicator.topAnchor.constraint(equalTo: loadingLabel.bottomAnchor, constant: 30).isActive = true
        loaderIndicator.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        
    }
    
    private func loadingViewElements() {
        setUpConstraints()
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        loadingViewElements()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with configuration: LoadingViewConfiguration) {
        loadingLabel.text = configuration.labelText
    }
}
