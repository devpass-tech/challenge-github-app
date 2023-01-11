//
//  LoadingView.swift
//  GitHubApp
//
//  Created by Marcelo Araujo on 11/01/23.
//

import UIKit

//struct LoadingVIewConfiguration {
//
//
//
//
//}

class LoadingView: UIView {
    
    private let searchView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let searchingTitle: UILabel = {
        let label = UILabel()
        label.text = "Searching repositories..."
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var activityIndicator: UIActivityIndicatorView {
        let acitivity = UIActivityIndicatorView()
        acitivity.style = .large
        acitivity.startAnimating()
        acitivity.translatesAutoresizingMaskIntoConstraints = false
        return acitivity
    }
    
    //MARK: - Inits
    override init(frame: CGRect) {
         super.init(frame: .zero)
        addSubviews()
        constraintsSubView()
     }
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    //MARK: - Adding subviews
    public func addSubviews() {
        addSubview(searchView)
        searchView.addSubview(searchingTitle)
        searchView.addSubview(activityIndicator)
    }
    
    //MARK: - addind setup constraints
    public func constraintsSubView(){
        setupConstraintsView()
        setUpConstraintsTitle()
        setUpConstraintsActivity()
    }
    
    
    //MARK: - Constrinats setup
    private func setupConstraintsView(){
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: bottomAnchor),
            searchView.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setUpConstraintsTitle(){
        NSLayoutConstraint.activate([
            searchingTitle.centerXAnchor.constraint(equalTo: self.searchView.centerXAnchor),
            searchingTitle.centerYAnchor.constraint(equalTo: self.searchView.centerYAnchor)
        ])
    }

    private func setUpConstraintsActivity(){
        NSLayoutConstraint.activate([
            activityIndicator.topAnchor.constraint(equalTo: searchingTitle.bottomAnchor),
            activityIndicator.leftAnchor.constraint(equalTo: searchingTitle.leftAnchor)
        ])
    }
}


