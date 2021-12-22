// Copyright © 2021 Bending Spoons S.p.A. All rights reserved.

import UIKit

class SettingsViewController: UIViewController {
  var interactor: SettingsInteractor?

  var viewModel: SettingsViewModel {
    didSet {
      self.settingsView.updateView(with: [self.viewModel])
    }
  }

  private var settingsView: SettingsView {
    return (self.view as? SettingsView)!
  }

  init(interactor: SettingsInteractor, viewModel: SettingsViewModel) {
    self.interactor = interactor
    self.viewModel = viewModel
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
    guard let interactor = interactor else {
      return
    }

    self.viewModel = interactor.getAppVersion()
  }
}
