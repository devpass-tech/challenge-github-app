// Copyright © 2021 DevPass. All rights reserved.

import Foundation

struct SettingsViewModel {
  let title: SettingsTitle
  let items: [String]

  init(title: SettingsTitle, items: [String]) {
    self.title = title
    self.items = items
  }

  var count: Int {
    return self.items.count
  }

  var titleForSection: String {
    return self.title.value
  }
}
