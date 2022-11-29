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

    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        navigationControllerSetup()
        setupSettingButton()
    }
    
    private func setupSettingButton() {
        navigationItem.leftBarButtonItem = settingsButton
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

    }

    override func loadView() {
        self.view = listView
    }


    
    private lazy var settingsButton: UIBarButtonItem = {
        let settings = UIBarButtonItem()
        settings.title = "Settings"
        settings.style = .plain
        settings.target = self
        navigationItem.rightBarButtonItem = settings
        //settings.action = #selector(navigateSettingsViewController)
        return settings
    }()
}

extension ListViewController: UISearchBarDelegate, UISearchControllerDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        //teste
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
