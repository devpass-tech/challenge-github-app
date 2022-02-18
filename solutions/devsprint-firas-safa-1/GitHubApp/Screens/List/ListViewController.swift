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
    
    private let settingsButton = UIBarButtonItem()
    private let searchBar = UISearchController()
    private let service = Service(network: NetworkManager())
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationSearch()
        configureSettingsButton()
    }

    override func loadView() {
        self.view = listView
    }
    
    func configureSettingsButton() {
        settingsButton.style = .plain
        settingsButton.title = "Settings"
        settingsButton.target = self
    }
    
    func configureSearchBar() {
        searchBar.searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBar.placeholder = "Type a GitHub user name"
        searchBar.searchBar.delegate = self
    }
    
    func configureNavigationSearch() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchBar
        navigationItem.rightBarButtonItem = settingsButton
        navigationItem.title = "Repositories"
        configureSearchBar()
    }
}

// Handling `UISearchBarDelegate` behavior
extension ListViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let search = searchBar.text ?? ""
            
        Task {
            let response = try await service.fetchList(username: search)
            self.listView.viewModel = ListViewModel(listItems: response)
        }
    }
}
