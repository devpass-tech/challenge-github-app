// Copyright © 2021 Bending Spoons S.p.A. All rights reserved.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = UINavigationController(rootViewController: ListViewController())
    self.window?.windowScene = windowScene
    self.window?.makeKeyAndVisible()
  }
}
