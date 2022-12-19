//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {
    
    private var userName: String = "devpass-tech"
    private let service = Service()

    private let listView: ListView = {

        let listView = ListView()
        return listView
    }()
    
    private lazy var searchController: UISearchController = {
        let controller = UISearchController()
        controller.searchBar.placeholder = "Type a GitHub user name"
//        controller.searchResultsUpdater = self
//        controller.delegate = self
        controller.obscuresBackgroundDuringPresentation = false
        return controller
    }()
    
    private lazy var settingsButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Settings"
        button.style = .plain
        button.target = self
        button.action = #selector(tappedSettingsButton)
        return button
    }()

    @objc func tappedSettingsButton() {
        let vc = SettingsViewController()
        present(UINavigationController(rootViewController: vc), animated: true)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Repositories"
        self.navigationItem.searchController = searchController
        self.navigationItem.rightBarButtonItem = settingsButton
    }

    override func viewDidAppear(_ animated: Bool) {
        
        service.fetchUserRepositories(userName: userName) { [weak self] repositories, error in
            
            // TODO: Modificar para switch case, dependendo da view que é para apresentar.
            
            if let repositories {
                DispatchQueue.main.async {
                    self?.listView.updateView(with: repositories)
                }
            } else {
                print("Error fetching")
            }
        }

    }

    override func loadView() {
        self.view = listView
    }
}

extension ListViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
        // TODO: Implementar busca e fetching. Alterar variável userName e dar um reload?
        
    }
}
