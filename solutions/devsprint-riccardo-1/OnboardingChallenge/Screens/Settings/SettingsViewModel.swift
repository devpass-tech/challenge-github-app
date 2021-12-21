// Copyright © 2021 Bending Spoons S.p.A. All rights reserved.

import Foundation

class SettingsViewModel {
  let title: SettingsTitle
  let items: [String]

  init(title: SettingsTitle, items: [String]) {
    self.title = title
    self.items = items
  }
}
