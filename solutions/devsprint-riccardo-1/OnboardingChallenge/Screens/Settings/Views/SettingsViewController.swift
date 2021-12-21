// Copyright © 2021 Bending Spoons S.p.A. All rights reserved.

import UIKit

class SettingsViewController: UIViewController {
  var interactor: SettingsInteractor?
  var viewModel: [SettingsViewModel] = []

  private lazy var settingsView: SettingsView = {
    return SettingsView()
  }()

  init(interactor: SettingsInteractor) {
    self.interactor = interactor
    super.init(nibName: nil, bundle: nil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.fetchAppInfo()
  }

  override func loadView() {
    self.view = self.settingsView
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func fetchAppInfo() {
    self.interactor?.getAppVersion { viewModel in
      self.viewModel.append(viewModel)
    }

    self.settingsView.updateView(with: self.viewModel)
  }
}
