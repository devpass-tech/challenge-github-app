//
//  SettingsViewController.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

class SettingsViewController: UIViewController{

    init(){
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = "Settings"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        self.view = SettingsView()
        
    }
    
}
