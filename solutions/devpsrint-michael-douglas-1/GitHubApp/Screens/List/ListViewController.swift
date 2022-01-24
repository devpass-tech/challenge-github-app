//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {

    // MARK: Properties

    private lazy var listView: ListView = {
        return ListView()
    }()
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Type a GitHub user name"
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        return searchController
    }()

    private let service = Service()

    // MARK: Initialization

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Overrides

    override func loadView() {

        self.view = self.listView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindEvents()
        self.fetchRepositories()
        self.setupUI()
    }
    
    private func fetchRepositories() {

        self.service.fetchRepositories(fromUserName: "devpass-tech") { repositories in
            let configuration = Configuration(repositories: repositories ?? [])

            DispatchQueue.main.sync { [weak self] in
                self?.listView.updateView(with: configuration)
            }
        }
    }
    
    // MARK: Methods
    private func bindEvents() {
        listView.goToDetailsViewController = { [weak self] in
            self?.showDetailsViewController()
        }
    }

    private func setupUI() {
        title = "Repositories"
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .systemGray6
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }
    
    private func showDetailsViewController() {
        let viewController = DetailViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {}
}

// MARK: - Configuration

extension ListViewController {

    struct Configuration {
        let repositories: [Repository]
    }
}
