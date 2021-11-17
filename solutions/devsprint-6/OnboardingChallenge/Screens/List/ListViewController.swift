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
        bindEvents()
        fetchList()
    }
    
    override func loadView() {
        view = listView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
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
    private func bindEvents() {
        listView.didSelectedRow = { [weak self] item in
            self?.instanceDetailsOf(item)
        }
    }
    
    private func setupUI() {
        title = "Repositories"
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let settingsButton = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(pressedSettings))
        navigationItem.rightBarButtonItem = settingsButton
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func fetchList() {

        self.service.fetchList(for: "devpass-tech") { items in
            
            let names = items.map { $0.name }

            let configuration = ListViewConfiguration(listItems: names)

            DispatchQueue.main.async {
                self.listView.updateView(with: configuration)
            }
        }
    }
    
    private func instanceDetailsOf(_ item: String) {
        let viewController = DetailViewController()
        viewController.title = item
        navigationController?.pushViewController(viewController, animated: false)
    }
}

// MARK: Extensions
extension ListViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) { }
}
