// Copyright © 2021 Bending Spoons S.p.A. All rights reserved.

import UIKit

extension UITableViewCell {
  class func classIdentifier() -> String {
    guard let className = String(describing: self).components(separatedBy: ".").last else {
      return ""
    }

    return className
  }
}
