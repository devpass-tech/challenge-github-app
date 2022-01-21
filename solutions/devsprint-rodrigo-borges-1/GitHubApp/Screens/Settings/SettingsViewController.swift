//
//  SettingsViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemGray5
        let proxy = UINavigationBar.appearance()
        proxy.standardAppearance = appearance
        proxy.scrollEdgeAppearance = appearance
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = SettingsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
    }
}
