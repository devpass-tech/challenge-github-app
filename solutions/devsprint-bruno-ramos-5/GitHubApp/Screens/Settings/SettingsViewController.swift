//
//  SettingsViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private let sectionTitle = "APP VERSION"
    private let sectionItems = ["Version 1.0"]
    
    private let settingsView = SettingsView()

    override func loadView() {
        self.view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsView.addSection(section: .init(title: sectionTitle, values: sectionItems))
    }
}
