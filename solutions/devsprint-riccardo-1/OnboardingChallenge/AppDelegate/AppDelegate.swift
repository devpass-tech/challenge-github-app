// Copyright © 2021 DevPass. All rights reserved.

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  // swiftlint:disable discouraged_optional_collection
  func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    return true
  }

  // swiftlint:enable discouraged_optional_collection

  // MARK: UISceneSession Lifecycle

  func application(
    _: UIApplication,
    configurationForConnecting connectingSceneSession: UISceneSession,
    options _: UIScene.ConnectionOptions
  ) -> UISceneConfiguration {
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
}
