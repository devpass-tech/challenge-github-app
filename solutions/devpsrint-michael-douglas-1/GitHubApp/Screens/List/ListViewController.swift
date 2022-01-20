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
<<<<<<< HEAD

=======
 
    // MARK: Initialization
>>>>>>> c12f42655d4e79e90505150b1fef62c4d7e0fe02
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
<<<<<<< HEAD

        self.fetchRepositories()
    }
    
    private func fetchRepositories() {

        self.service.fetchRepositoryList("devpass-tech") { repositories in
            let configuration = ListViewConfiguration(listRepositories: repositories!)
            
            DispatchQueue.main.sync { [weak self] in
                self?.listView.updateView(with: configuration)
            }
=======
        self.fetchList()
        setupUI()
    }
    
    // MARK: Methods
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

    private func fetchList() {
        self.service.fetchList { items in
            let configuration = ListViewConfiguration(listItems: items)
            self.listView.updateView(with: configuration)
>>>>>>> c12f42655d4e79e90505150b1fef62c4d7e0fe02
        }
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {}
}


