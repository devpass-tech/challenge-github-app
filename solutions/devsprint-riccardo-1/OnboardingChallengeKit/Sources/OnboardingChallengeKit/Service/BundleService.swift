// Copyright © 2021 DevPass. All rights reserved.

import Foundation

protocol BundleService {
  var appVersion: String { get }
}

extension Bundle: BundleService {
  var appVersion: String {
    guard let result = infoDictionary?["CFBundleShortVersionString"] as? String else { return "" }
    return result
  }
}
