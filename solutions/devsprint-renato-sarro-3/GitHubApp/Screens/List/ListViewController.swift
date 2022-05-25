//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {

    // MARK: - Properties
    private let listView: ListView = {
        let listView = ListView()
        return listView
    }()

    private let service = Service()

    // MARK: Initializations
    init() {
        super.init(nibName: nil, bundle: nil)
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
        self.view = listView
    }
    
    // MARK: - Methods
    private func setupUI() {
        title = "Repositories 🐙"
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
    
    private func fetchList() {
        self.service.fetchList { items in
            let configuration = ListViewConfiguration(listItems: items)
            self.listView.updateView(with: configuration)
        }
    }
}
