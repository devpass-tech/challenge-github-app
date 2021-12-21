// Copyright © 2021 Bending Spoons S.p.A. All rights reserved.

import Foundation

protocol LoadingPropertyInfo {
  func getAppVersion(completion: @escaping (SettingsViewModel) -> Void)
}

class SettingsInteractor: LoadingPropertyInfo {
  var bundleService: BundleService?

  init(bundleService: BundleService) {
    self.bundleService = bundleService
  }

  func getAppVersion(completion: @escaping (SettingsViewModel) -> Void) {
    guard let version = bundleService?.appVersion else { return }
    let viewModel = SettingsViewModel(title: .appVersion, items: ["Version" + version])
    completion(viewModel)
  }
}
