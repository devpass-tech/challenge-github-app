//
//  ViewController.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {


    private var emptyView: UIView {
        
        let view = EmptyView()
        
        return view
        
}
    
    private lazy var listView: ListView = {
        var listView = ListView()
        listView.listViewController = self
        return listView
    }()

    private let service = Service()
    private let search = UISearchController(searchResultsController: nil)

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
        setupNavigation()
    }
    
    func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Repositories"
    
        search.searchBar.delegate = self
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type a GitHub user name"
        search.searchBar.autocapitalizationType = .none
        navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .done, target: self, action: #selector(settingBtn(sender:)))
    }
    
    @objc private func settingBtn(sender: UIBarButtonItem) {
        let settingsScreen = SettingsViewController()
        present(settingsScreen, animated: true)
    }
    
    private func fetchList(username: String) {
        self.service.fetchList(username: username) { repositories in
            let configuration = ListViewConfiguration(listItems: repositories ?? [])
            DispatchQueue.main.async {
                self.listView.updateView(with: configuration)
            }
        }
    }
    
    func navigateToDetail () {
        
        let newController = DetailViewController()
        navigationController?.pushViewController(newController, animated: true)
    }
}

extension ListViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {}
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        self.fetchList(username: text)
    }
}
