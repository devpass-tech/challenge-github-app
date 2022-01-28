//
//  DetailViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit


import UIKit

class DetailViewController: UIViewController {

    let detail = DetailView()

    init() {
        super.init(nibName: nil, bundle: nil)

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
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = detail
    }
}
