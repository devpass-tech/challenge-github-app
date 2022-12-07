//
//  SettingsViewController.swift
//  GitHubApp
//
//  Created by Rafael Mazzoco on 07/12/22.
//

import UIKit

class SettingsViewController: UIViewController {

    override func loadView() {
        self.view = SettingsView()
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .darkText
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        title = "Settings"
    }
}
