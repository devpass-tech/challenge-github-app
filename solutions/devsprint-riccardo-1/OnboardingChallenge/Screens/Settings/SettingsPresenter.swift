//
//  SettingsPresenter.swift
//  OnboardingChallenge
//
//  Created by Strawberry Pie on 12/14/21.
//

import Foundation

protocol SettingsPresentationLogic {
    func presenter(response: SettingsViewConfiguration.Get.Response)
}

class SettingsPresenter: SettingsPresentationLogic {
    weak var viewController: SettingsViewController?
    
    func presenter(response: SettingsViewConfiguration.Get.Response) {
        let displayed = SettingsViewConfiguration.DisplayedSettings(item: "Version \(response.item)")
        let viewModel = SettingsViewConfiguration.Get.ViewModel(displayed: displayed)
        self.viewController?.display(viewModel: viewModel)
    }
}
