// Copyright © 2021 DevPass. All rights reserved.

import Foundation

protocol LoadingPropertyInfo {
  func getAppVersion() -> SettingsViewModel
}

class SettingsInteractor: LoadingPropertyInfo {
  var bundleService: BundleService

  init(bundleService: BundleService) {
    self.bundleService = bundleService
  }

  func getAppVersion() -> SettingsViewModel {
    let version = self.bundleService.appVersion
    let viewModel = SettingsViewModel(title: .appVersion, items: ["Version " + version])
    return viewModel
  }
}
