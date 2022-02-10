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
        let settingsButton = UIBarButtonItem()
        settingsButton.target = self
        settingsButton.title = "Settings"
        settingsButton.style = .plain
        return settingsButton
    }()
    
    private let searchBar = UISearchController()

    private let service = Service()

    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationSearch()
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
    
    func configureSearchBar() {
        searchBar.searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBar.placeholder = "Type a GitHub user name"
        searchBar.delegate = self
    }
    
    func configureNavigationSearch() {
        navigationItem.searchController = searchBar
        configureSearchBar()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Repositories"
        navigationItem.rightBarButtonItem = settingsButton
    }
}

extension ListViewController: UISearchControllerDelegate {
    
}
