//
//  SettingsViewController.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

let NUMBEROFROWSINSECTION = 1

protocol SettingsViewDisplayLogic {
    func display(viewModel: ShowSettings.Get.ViewModel)
}

class SettingsViewController: UIViewController {
    
    private lazy var settingsView: SettingsView = {
        return SettingsView()
    }()
    
    var interactor: SettingsBusinessLogic?
    var presenter: SettingsPresentationLogic?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = ShowSettings.Get.Request(key: "CFBundleVersion")
        interactor?.getAppVersion(request: request)
    }
    
    override func loadView() {
        self.view = self.settingsView
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        let viewController = self
        let interactor = SettingsInteractor(bundle: Bundle.main)
        let presenter = SettingsPresenter()
        
        viewController.interactor = interactor
        viewController.presenter = presenter
        
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

extension SettingsViewController: SettingsViewDisplayLogic {
    func display(viewModel: ShowSettings.Get.ViewModel) {
        self.settingsView.updateView(with: viewModel)
    }
}
