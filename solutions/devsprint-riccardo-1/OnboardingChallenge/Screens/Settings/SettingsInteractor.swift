//
//  SettingsInteractor.swift
//  OnboardingChallenge
//
//  Created by Strawberry Pie on 12/14/21.
//

import Foundation

protocol SettingsBusinessLogic {
    func getAppVersion(request: ShowSettings.Get.Request)
}

class SettingsInteractor: SettingsBusinessLogic {
    var presenter: SettingsPresentationLogic?
    var bundle: BundleService?
    
    init(bundle: BundleService) {
        self.bundle = bundle
    }
    
    func getAppVersion(request: ShowSettings.Get.Request) {
        guard let value = self.bundle?.object(forInfoDictionaryKey: request.key) as? String else { return }
        let response = ShowSettings.Get.Response(item: value)
        
        self.presenter?.presenter(response: response)
    }
}
