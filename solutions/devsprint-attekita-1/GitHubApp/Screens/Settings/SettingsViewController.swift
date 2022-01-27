//
//  SettingsViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    override func loadView() {
        self.view = SettingsView()
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "SettingsTitleBGColor")
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "SettingsTitleColor") ?? .black]
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        title = "Settings"
    }
}
