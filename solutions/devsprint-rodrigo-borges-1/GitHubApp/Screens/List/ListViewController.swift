//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {
    
    private let loadingView: LoadingView = LoadingView()
    
    private lazy var listView: ListView = {
        let listView = ListView()
        listView.delegate = self
        return listView
    }()
    
    lazy var searchController = UISearchController(searchResultsController: nil)
    
    private let service = Service()
    
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
        self.fetchRepos(username: "devpass-tech")
        self.configureNavigationBar()
    }
    
    private func fetchRepos(username: String){
        self.service.fetchRepositories(username){ repositories in
            guard let repositories = repositories else {
                return
            }
            
            let configuration = ListViewConfiguration(listRepositories: repositories)
            
            DispatchQueue.main.async {
                self.listView.updateView(with: configuration)
                self.loadView()
            }
            
        }
    }
    

    @objc func onNavigateToSettings() {
        let settingsVC = SettingsViewController()
        settingsVC.modalPresentationStyle = .formSheet
        let navVC = UINavigationController(rootViewController: settingsVC)
        self.present(navVC, animated: true, completion: nil)
    }
  
    func navigateToDetails() {
        
        let viewController = DetailViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ListViewController: ListViewDelegate {
    
    func didSelectRepository(_ repository: Repository) {
        self.navigateToDetails()
    }
}

extension ListViewController {
    func configureNavigationBar() {
        searchController.searchBar.placeholder = "Type a GitHub user name"
        searchController.searchBar.delegate = self
        title = "Repositories"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(onNavigateToSettings))
        navigationItem.searchController = searchController
        
    }
}

extension ListViewController: UISearchBarDelegate {
   
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let text = searchBar.text else { return print("You sould type a name") }
        self.view = self.loadingView
        let loadingViewConfiguration = LoadingViewConfiguration(textLabel: "Search repositories...")
        loadingView.updateView(with: loadingViewConfiguration)
        self.fetchRepos(username: text)
        searchBar.text = ""
    }
}
