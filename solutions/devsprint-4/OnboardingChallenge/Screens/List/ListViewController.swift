//
//  ViewController.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController, ClickCellDelegate {
    
    private lazy var listView: ListView = {
        let listView = ListView()
        listView.delegate = self
        return listView
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
        searchController.searchBar.delegate = self
        
        self.definesPresentationContext = true
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "Repositories"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func fetchList(with userName: String) {

        self.service.fetchList(userName: userName) { items in

            let names = items.map { $0.name }

            let configuration = ListViewConfiguration(listItems: names)

            DispatchQueue.main.async {
                self.listView.updateView(with: configuration)
            }
        }
    }

    func segueDetailViewController() {
        let vc = DetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        //
    }
}

extension ListViewController: UISearchBarDelegate, UISearchControllerDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let userName = searchBar.text ?? ""
        self.fetchList(with: userName)
    }

}
