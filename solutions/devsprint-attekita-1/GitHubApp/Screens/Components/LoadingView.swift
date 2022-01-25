//
//  LoadingView.swift
//  GitHubApp
//
//  Created by Victor Pizetta on 18/01/22.
//

import UIKit

struct LoadingViewConfiguration {
    var labelText: String
}

final class LoadingView: UIView {
        
    private var loadingLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.autoresizesSubviews = true
        label.backgroundColor = .white
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private let activityIndicator : UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        return indicator
    }()
    
    private func setUpConstraints() {
        
        addSubview(loadingLabel)
        
        loadingLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        loadingLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        addSubview(activityIndicator)
        
        activityIndicator.topAnchor.constraint(equalTo: loadingLabel.bottomAnchor, constant: 30).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        
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
