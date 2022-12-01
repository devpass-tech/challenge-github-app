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
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .gray
        label.text = "Searching Repositories..."
        return label
    }()
    
    private lazy var loaderIndicator : UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .medium)
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.color = .white
        // loader.hidesWhenStopped = true
        loader.startAnimating()
        return loader
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        buildHierarchy()
        setupConstraints()
        //applyAdditionalChanges()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
    extension LoadingView: ViewCodable {
        
        func buildHierarchy() {
            addSubview(loadingLabel)
            addSubview(loaderIndicator)
        }
        
         func setupConstraints() {
            
            addSubview(loadingLabel)
            loadingLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
            loadingLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
            
            addSubview(loaderIndicator)
            
            loaderIndicator.topAnchor.constraint(equalTo: loadingLabel.bottomAnchor, constant: 30).isActive = true
            loaderIndicator.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
            
        }
        
        func applyAdditionalChanges() {
            self.backgroundColor = .white
        }
        
        func updateView(with configuration: LoadingViewConfiguration) {
            loadingLabel.text = configuration.labelText
        }
    }
