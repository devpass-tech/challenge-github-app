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
    
    private lazy var StackView:UIStackView = {
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
    
    private func initializeLoadingSpiner(){
        loadingSpinner.transform = CGAffineTransform(scaleX: 1.7,y: 1.7)
        showLoadingSpiner()
    }
    
    // MARK: - Layout Setup
    
    init(){
        super.init(frame: .zero)
        backgroundColor = .white
        loadView()
        loadConstraints()
        let configuration = LoadingViewConfiguration(loadingMessageText: "Searching repositories...")
        ConfigureLoadingView(with: configuration)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadView() {
        initializeLoadingSpiner()
        addSubview(StackView)
    }
    
    private func loadConstraints(){
        constraintStackView()
    }

    private func constraintStackView(){
        StackView.translatesAutoresizingMaskIntoConstraints = false
        StackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        StackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        StackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        StackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
     }
    
    
    
    // MARK: - Actions
    @objc func showLoadingSpiner() {
        loadingMessage.isHidden = false
        loadingSpinner.startAnimating()
    }

    @objc func hideLoadingSpiner() {
        loadingMessage.isHidden = true
        loadingSpinner.stopAnimating()
    }
    
    func ConfigureLoadingView(with configuration: LoadingViewConfiguration){
        loadingMessage.text = configuration.loadingMessageText
    }
}
