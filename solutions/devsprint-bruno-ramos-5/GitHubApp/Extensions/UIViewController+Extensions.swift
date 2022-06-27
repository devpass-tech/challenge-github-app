//
//  UIViewController+Extensions.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 06/10/21.
//

import UIKit

extension UIViewController {

    func insideNavigationController() -> UINavigationController {

        let navigationController = UINavigationController(rootViewController: self)
        navigationController.modalPresentationStyle = .formSheet

        return navigationController
    }
}
