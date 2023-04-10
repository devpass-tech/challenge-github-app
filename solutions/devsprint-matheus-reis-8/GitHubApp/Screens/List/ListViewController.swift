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
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Type a GitHub user name"
        
        return searchController
    }()

    private let service = Service()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        setupNavigationBar()
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
    
    private func setupNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(red: 245, green: 245, blue: 245)
        
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Repositories"
        navigationItem.searchController = searchController
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let text = searchBar.text
        searchController.isActive = false
        searchBar.text = text
    }
}
