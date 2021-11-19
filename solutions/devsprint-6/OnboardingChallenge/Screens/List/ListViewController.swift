//
//  ViewController.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {
    // MARK: Properties
    private let service = Service()
    private lazy var listView: ListView = {
        return ListView()
    }()
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Type a GitHub user name"
        searchController.hidesNavigationBarDuringPresentation = false
        return searchController
    }()
    
    // MARK: Outlets
    
    // MARK: Initializers
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func loadView() {
        view = listView
    }
    
    // MARK: Actions
    @objc
    func pressedSettings() {
        debugPrint("Open Settings")
        let settingsViewController = SettingsViewController()
        let navBarController = UINavigationController(rootViewController: settingsViewController)
        navBarController.navigationBar.backgroundColor = .systemGray5
        navigationController?.present(navBarController , animated: true, completion: nil)
    }
    
    // MARK: Methods
    private func setupUI() {
        title = "Repositories"
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let settingsButton = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(pressedSettings))
        navigationItem.rightBarButtonItem = settingsButton
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
        
    private func fetchList(for user: String) {

        self.service.fetchList(for: user) { items in

            let configuration = ListViewConfiguration(repositories: items)
            
            DispatchQueue.main.async {
                self.listView.updateView(with: configuration)
            }
        }
    }
}

// MARK: Extensions
extension ListViewController: UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) { }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        fetchList(for: searchController.searchBar.text ?? "")
    }
}
