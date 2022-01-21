//
//  EmptyViewController.swift
//  GitHubApp
//
//  Created by Emanuel Hespanhol Costa on 18/01/22.
//

import UIKit

class EmptyViewController: UIViewController {

    let emptyView = EmptyView()
    
    override func loadView(){
        self.view = emptyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
