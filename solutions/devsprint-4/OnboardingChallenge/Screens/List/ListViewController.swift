//
//  ViewController.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {

    private lazy var listView: ListView = {

        return ListView()
    }()

    private let service = Service(userName: "")
    
    let searchController = UISearchController(searchResultsController: nil)

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
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Type a GitHub user name"
        searchController.hidesNavigationBarDuringPresentation = false
        
        self.definesPresentationContext = true
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "Repositories"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.fetchList()
    }

    private func fetchList() {

        self.service.fetchList(userName: "rdgborges") { items in

            let names = items.map { $0.name }

            let configuration = ListViewConfiguration(listItems: names)

            DispatchQueue.main.async {
                self.listView.updateView(with: configuration)
            }
        }
    }
}

extension ListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        //
    }
}
