//
//  DetailViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit


class DetailViewController: UIViewController {

    override func loadView() {
        let detail = DetailView()
        detail.backgroundColor = .white
        
        let buttonProfile = DefaultButton().makeButton(withText: "Profile",
                                                     width: 200,
                                                     height: 30)
        
        let buttonLicense = DefaultButton().makeButton(withText: "License",
                                                     width: 200,
                                                     height: 30)
        detail.addSubview(buttonProfile)
        detail.addSubview(buttonLicense)
        
        NSLayoutConstraint.activate([
            buttonProfile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            buttonProfile.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            buttonLicense.topAnchor.constraint(equalTo: buttonProfile.bottomAnchor, constant: 20),
            buttonLicense.leadingAnchor.constraint(equalTo: buttonProfile.leadingAnchor)
            
            
        ])
        
        self.view = detail
    }
}
