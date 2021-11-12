//
//  UINavigationController+Extensions.swift
//  OnboardingChallenge
//
//  Created by Pedro Gabriel on 09/11/21.
//

import UIKit

extension UINavigationController {
    func setupLightGrayAppearance() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearance.backgroundColor = .systemGray6
        navigationBar.standardAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navBarAppearance
    }
}
