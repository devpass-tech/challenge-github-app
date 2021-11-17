//
//  ViewController.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {

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
        self.fetchList()
        setupNavigation()
    }
    
    func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Repositories"
    
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type a GitHub user name"
        navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .done, target: self, action: #selector(settingBtn(sender:)))
    }
    
    @objc private func settingBtn(sender: UIBarButtonItem) {
        let settingsScreen = SettingsViewController()
        present(settingsScreen, animated: true)
    }

    
    private func fetchList() {

        self.service.fetchList { items in

            let configuration = ListViewConfiguration(listItems: items)

            self.listView.updateView(with: configuration)
        }
    }
    
    func navigateToDetail () {
        
        let newController = DetailViewController()
        navigationController?.pushViewController(newController, animated: true)
    }
}

extension ListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
        //TO DO: implementar os resultado do seach
    }
}


