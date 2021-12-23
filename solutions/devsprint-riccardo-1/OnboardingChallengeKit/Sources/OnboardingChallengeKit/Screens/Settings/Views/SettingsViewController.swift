// Copyright © 2021 DevPass. All rights reserved.

import UIKit

class SettingsViewController: UIViewController {
  var interactor: SettingsInteractor

  var viewModel: SettingsViewModel? {
    didSet {
      if let viewModel = viewModel {
        self.settingsView.updateView(with: [viewModel])
      }
    }
  }

  private var settingsView: SettingsView {
    return (self.view as? SettingsView)!
  }

  init(interactor: SettingsInteractor) {
    self.interactor = interactor
    super.init(nibName: nil, bundle: nil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.fetchAppInfo()
  }

  override func loadView() {
    self.view = SettingsView()
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func fetchAppInfo() {
    self.viewModel = self.interactor.getAppVersion()
  }
}
