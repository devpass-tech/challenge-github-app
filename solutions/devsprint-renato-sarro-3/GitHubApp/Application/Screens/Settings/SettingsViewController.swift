//
//  SettingsViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

final class SettingsViewController: UIViewController {
    // MARK: - Life Cycles
    override func loadView() {
        self.view = SettingsView()
        setupNavigationBar()
    }
    
    // MARK: - Methods
    private func setupNavigationBar() {
        let appearence = UINavigationBarAppearance()
        appearence.backgroundColor = UIColor(named: "SettingsTitleBGColor")
        appearence.titleTextAttributes = [.foregroundColor: UIColor(named: "SettingsTitleColor") ?? .black]
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
        title = "Settings"
    }
}
