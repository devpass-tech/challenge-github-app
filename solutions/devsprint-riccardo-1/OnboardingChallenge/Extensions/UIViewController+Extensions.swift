// Copyright © 2021 Bending Spoons S.p.A. All rights reserved.

import UIKit

extension UIViewController {
  func insideNavigationController() -> UINavigationController {
    let navigationController = UINavigationController(rootViewController: self)
    navigationController.modalPresentationStyle = .formSheet

    return navigationController
  }
}
