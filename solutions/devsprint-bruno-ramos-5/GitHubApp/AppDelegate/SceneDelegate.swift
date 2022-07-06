//
//  SceneDelegate.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        self.window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = SampleConfigurator.make()
        self.window?.rootViewController = UINavigationController(rootViewController: viewController)
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
    }
}

