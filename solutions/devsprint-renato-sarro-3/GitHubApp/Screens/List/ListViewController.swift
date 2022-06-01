//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

protocol ListViewControllerProtocol: AnyObject {
    func navigationDetail(listItens: RepositoryCellViewConfiguration)
}

final class ListViewController: UIViewController, UISearchResultsUpdating {

    private var listView: ListViewProtocol

    private let service: ServiceProtocol
    
    // MARK: - UI Components
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Type a GitHub user name"
        searchController.hidesNavigationBarDuringPresentation = false
        return searchController
    }()
    
    private lazy var settingsButton: UIBarButtonItem = {
        let settingsButton = UIBarButtonItem()
        settingsButton.title = "Settings"
        settingsButton.style = .plain
        settingsButton.tintColor = .systemBlue
        settingsButton.target = self
        settingsButton.action = #selector(navigationSettingsViewController)
        return settingsButton
    }()

    // MARK: Initializations
    init(listView: ListViewProtocol = ListView(), service: ServiceProtocol = Service()) {
        self.listView = listView
        self.service = service
        
        super.init(nibName: nil, bundle: nil)
        
        self.listView.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycles
    override func viewDidLoad() {
        setupUI()
        fetchList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }
    
    override func loadView() {
        self.view = listView as? UIView
    }
    
    // MARK: - Objcs
    @objc
    func navigationSettingsViewController() {
        let settingsViewController = SettingsViewController()
        settingsViewController.modalPresentationStyle = .formSheet
        let navigationSettingsVC = UINavigationController(rootViewController: SettingsViewController())
        self.present(navigationSettingsVC, animated: true, completion: nil)
    }
    
    // MARK: - Methods
    private func setupUI() {
        title = "Repositories 🐙"
        searchControllerUI()
        navigationItem.rightBarButtonItem = settingsButton
    }
    
    private func searchControllerUI() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchResultsUpdater = self
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        fetchList(user: text.lowercased())
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearence = UINavigationBarAppearance()
        appearence.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearence.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.compactAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
    }
    
    private func fetchList(user: String = "rsarromatos") {
        service.fetchData(request: RepositoryRequest(user: user)) { (result: Result<[Repository], ApiError>) in
            switch result {
            case .success(let items):
                let configuration = ListViewConfiguration(listItems: items.map { RepositoryCellViewConfiguration(name: $0.name,
                                                                                                                 description: $0.description ?? "") })
                self.listView.updateView(with: configuration)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ListViewController: ListViewControllerProtocol {
    func navigationDetail(listItens: RepositoryCellViewConfiguration) {
        let vc  = DetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
