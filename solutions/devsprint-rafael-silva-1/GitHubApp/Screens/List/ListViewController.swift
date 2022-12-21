//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {
     
    private let listView = ListView()
    private let emptyView = EmptyView()
    private let loadingView = LoadingView()
    
    private lazy var searchController: UISearchController = {
        let controller = UISearchController()
        controller.searchBar.placeholder = "Type a GitHub user name"
        controller.searchResultsUpdater = self
        controller.delegate = self
        controller.obscuresBackgroundDuringPresentation = false
        return controller
    }()

    private let service = Service()

    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {

        self.view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Repositories"
        self.navigationItem.searchController = searchController
    }

    override func viewDidAppear(_ animated: Bool) {
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }

    override func loadView() {
        self.view = emptyView
    }
}

extension ListViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }

        self.view = loadingView

        service.fetchUserRepositories(userName: text) { [weak self] repositories, error in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if let repositories {
                    self?.listView.updateView(with: repositories)
                    self?.view = self?.listView
                    
                } else {
                    self?.view = self?.emptyView
                }
                
            }
        }
    }
}
