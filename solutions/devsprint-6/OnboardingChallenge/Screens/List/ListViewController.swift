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
    private lazy var buttonView: ButtonView = {
        ButtonView()
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
        fetchList()
    }
    
    override func loadView() {
//        view = listView
        
        view = buttonView
        buttonView.updateView(with: ButtonViewConfiguration(title: "Hu3",
                                                            action: UIAction(handler: { [weak self] _ in
            self?.buttonAction()
        })))
    }
    
    // MARK: Actions
    @objc
    func pressedSettings() {
        debugPrint("Open Settings")
    }
    
    private func buttonAction() {
        print("Button tapped")
    }
    
    // MARK: Methods
    private func setupUI() {
        title = "Repositories"
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let settingsButton = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(pressedSettings))
        navigationItem.rightBarButtonItem = settingsButton
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
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
}

// MARK: Extensions
extension ListViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) { }
}
