//
//  SettingsViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

class SettingsViewController: UIViewController {

    override func loadView() {
        self.view = SettingsView()
    }
    
    override func viewDidLoad() {
        self.navigationItem.title = "Settings"
        
    }
}
