// Copyright © 2021 DevPass. All rights reserved.

import Foundation

enum SettingsTitle {
  case appVersion

  var value: String {
    switch self {
    case .appVersion: return "App Version"
    }
  }
}
