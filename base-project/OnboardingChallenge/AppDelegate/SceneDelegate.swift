//
//  SceneDelegate.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let viewController = ListViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.setupLightGrayAppearance()
        
        self.window?.rootViewController = navigationController
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
    }
}
