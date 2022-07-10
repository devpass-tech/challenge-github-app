//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {

    private let listView: ListView = {

        let listView = ListView()
        return listView
    }()
    
    private lazy var settingsButton: UIBarButtonItem = {
        return UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(navigateToSettings))
    }()

    private let service = Service()

    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "GitHub App 🐙"
        self.navigationItem.rightBarButtonItem = settingsButton
    }
    
    @objc func navigateToSettings(){
        let settingsVC = SettingsViewController()
        settingsVC.modalPresentationStyle = .automatic
        self.navigationController?.present(settingsVC, animated: true, completion: nil)
    }

    override func viewDidAppear(_ animated: Bool) {

        service.fetchList { repositories in

            DispatchQueue.main.async {

                self.listView.updateView(with: repositories)
            }
        }

    }

    override func loadView() {
        self.view = listView
    }
}
