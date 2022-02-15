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
    private let service = Service()
    private let network = NetworkManager()
    
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

    override func viewDidAppear(_ animated: Bool) {
        service.fetchList { [weak self] repositories in
            DispatchQueue.main.async {
                self?.listView.viewModel = ListViewModel(listItems: repositories)
            }
        }
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
        searchBar.searchResultsUpdater = self
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
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let search = searchBar.text ?? ""
        let getUserRepos = GetUserRepos(path: ["users", search, "repos"])
        
        Task {
            do {
                let result = try await network.request(with: getUserRepos)
                print(result)
            } catch let error {
                print(error)
            }
        }
    }
}

// Handling `UISearchResultsUpdating` behavior
extension ListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
