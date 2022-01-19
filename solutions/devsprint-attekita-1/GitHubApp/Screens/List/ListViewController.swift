//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {

    private lazy var listView: ListView = {

        return ListView()
    }()

    private let service = Service()
    
    private let searchController = UISearchController(searchResultsController: nil)
 
    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = self.listView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchList()
        self.navigationControllerSetup()
       
    }

    private func fetchList() {

        self.service.fetchList { items in

            let configuration = ListViewConfiguration(listItems: items)

            self.listView.updateView(with: configuration)
        }
    }
    
    func navigationControllerSetup() {
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
}

extension ListViewController: UISearchBarDelegate, UISearchControllerDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        let userName = searchBar.text ?? ""
//        self.fetchList(with: userName)
    }

}

extension ListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) { }
}

