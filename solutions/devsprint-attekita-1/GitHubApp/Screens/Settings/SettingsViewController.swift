//
//  SettingsViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let settingsView = SettingsView()

    override func loadView() {
        self.view = SettingsView()
        navigationController?.navigationBar.scrollEdgeAppearance = settingsView.appearance
        title = "Settings"
    }
}
