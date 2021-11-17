//
//  LoadingViewController.swift
//  OnboardingChallenge
//
//  Created by Hafsa Nouiri on 09/11/21.
//

import UIKit

struct LoadingViewConfiguration{
    let loadingMessageText:String
}

class LoadingView: UIView {

    // MARK: - UIComponents
    
    private lazy var loadingMessage:UILabel = {
       let label = UILabel()
        label.isHidden = true
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 1
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var stackView:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
        loadingMessage,
        loadingSpinner])
        stackView.backgroundColor = .clear
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.setCustomSpacing(20, after: loadingMessage)
         return stackView
    }()
    
    // MARK: - Initializer
    
    var loadingSpinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    
    private func initializeLoadingSpinner(){
        loadingSpinner.transform = CGAffineTransform(scaleX: 1.7,y: 1.7)
        showLoadingSpinner()
    }
    
    // MARK: - Layout Setup
    
    init(){
        super.init(frame: .zero)
        backgroundColor = .white
        loadView()
        loadConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadView() {
        initializeLoadingSpinner()
        addSubview(stackView)
    }
    
    private func loadConstraints(){
        constraintStackView()
    }

    private func constraintStackView(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
     }
    
    
    
    // MARK: - Actions
    @objc func showLoadingSpinner() {
        loadingMessage.isHidden = false
        loadingSpinner.startAnimating()
    }

    @objc func hideLoadingSpinner() {
        loadingMessage.isHidden = true
        loadingSpinner.stopAnimating()
    }
    
    func configureLoadingView(with configuration: LoadingViewConfiguration){
        loadingMessage.text = configuration.loadingMessageText
    }
}
