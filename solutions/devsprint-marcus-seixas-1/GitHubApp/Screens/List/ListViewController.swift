//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {

    private let searchController = UISearchController(searchResultsController: nil)

    private let listView: ListView = {

        let listView = ListView()
        return listView
    }()

    private let service = Service()
    private var buttonName: String?
    private var titleName: String?

    init(titulo: String? = "Repositories" , nomeBotao: String? = "Settings") {
            super.init(nibName: nil, bundle: nil)
            buttonName = nomeBotao
            titleName = titulo
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        navigationControllerSetup()
        setupSettingButton()
    }
    
    private func setupSettingButton() {
        navigationItem.rightBarButtonItem = settingsButton
    }
    
    private func navigationControllerSetup() {
         self.navigationItem.searchController = searchController
         self.navigationItem.title = "Repositories"
         self.navigationController?.navigationBar.prefersLargeTitles = true
         self.definesPresentationContext = true
         self.searchBarControllerSetup()
     }
    
    private func searchBarControllerSetup() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Type a GitHub user name"
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        self.listView.showEmptyView()
    }

    override func loadView() {
        self.view = listView
    }

    private func searchGitUser(username: String) {
        listView.showLoadingView()
        listView.hideEmptyView()
        service.fetchList(for: username) { repositories in
            self.listView.hideLoadingView()
            if repositories.isEmpty {
                self.listView.showEmptyView()
            } else {
                self.listView.hideEmptyView()
            }
            self.listView.updateView(with: repositories)
        }
    }
    
    private lazy var settingsButton: UIBarButtonItem = {
           let settings = UIBarButtonItem()
           settings.title = buttonName
           settings.style = .plain
           settings.target = self
           settings.action = #selector(navigateSettingsViewController)
           return settings
       }()
       
       @objc private func navigateSettingsViewController() {
           let settings = SettingsViewController()
           navigationController?.present(settings, animated: true, completion: nil)
       }
}

extension ListViewController: UISearchBarDelegate, UISearchControllerDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let username = searchBar.text {
            searchGitUser(username: username)
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print(searchBar.text ?? "")
    }
}

extension ListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text ?? "")
    }
}
