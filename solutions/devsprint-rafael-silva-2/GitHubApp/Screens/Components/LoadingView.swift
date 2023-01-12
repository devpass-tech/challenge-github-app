//
//  LoadingView.swift
//  GitHubApp
//
//  Created by Marcelo Araujo on 11/01/23.
//

import UIKit

struct LoadingViewConfiguration {
    
    var title: String
    
}

class LoadingView: UIView {
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
        addSubview(stackView)
        self.stackView.addArrangedSubview(searchingTitle)
        self.stackView.addArrangedSubview(activityIndicator)
    }
    //MARK: - addind setup constraints
    public func constraintsSubView(){
        setUpConstraintsStack()
    }
    //MARK: - Constrinats
    private func setUpConstraintsStack(){
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    //MARK: - fun para update de view
    public func updateView(with configuration: LoadingViewConfiguration){
        searchingTitle.text = configuration.title
    }
}
