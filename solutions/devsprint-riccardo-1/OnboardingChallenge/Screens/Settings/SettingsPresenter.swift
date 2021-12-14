//
//  SettingsPresenter.swift
//  OnboardingChallenge
//
//  Created by Strawberry Pie on 12/14/21.
//

import Foundation

protocol SettingsPresentationLogic {
    func presenter(response: ShowSettings.Get.Response)
}

class SettingsPresenter: SettingsPresentationLogic {
    weak var viewController: SettingsViewController?
    
    func presenter(response: ShowSettings.Get.Response) {
        let displayed = ShowSettings.DisplayedSettings(item: "Version \(response.item)")
        let viewModel = ShowSettings.Get.ViewModel(displayed: displayed)
        self.viewController?.display(viewModel: viewModel)
    }
}
