//
//  LoadingViewController.swift
//  OnboardingChallenge
//
//  Created by Desenvolvimento on 09/11/21.
//

import UIKit

class LoadingViewController: UIViewController {

    // MARK: - UIComponents
    
    private lazy var loadingMessage:UILabel = {
       let label = UILabel()
        label.text = "Searching repositories..."
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 1
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var containerView:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
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

    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
        loadConstraints()
        
    }
    
    override func loadView() {
        initializeLoadingSpiner()
        self.view = self.containerView
        containerView.addSubview(StackView)
        
    }
    
    private func loadConstraints(){
        constraintContenerView()
        constraintStackView()
    }
    
    private func constraintContenerView(){
        containerView.translatesAutoresizingMaskIntoConstraints = true
        containerView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
     }
     
    private func constraintStackView(){
        StackView.translatesAutoresizingMaskIntoConstraints = false
        StackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        StackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        StackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        StackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
     }
    
    
    
    // MARK: - Actions
    @objc func showLoadingSpiner() {
        loadingSpinner.startAnimating()
    }

    @objc func hideLoadingSpiner() {
        loadingSpinner.stopAnimating()
    }
}
