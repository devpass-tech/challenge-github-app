//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {

    private let listView: ListView = {

        let listView = ListView()
        return listView
    }()
    

    private let emptyView: EmptyView = {
        
        let emptyView = EmptyView()
        return emptyView
    }()

    private let loadingView = LoadingView()


    private let service = Service()

    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "GitHub App 🐙"
        
        self.loadingView.updateView(with: LoadingViewConfiguration(description: "Searching repositories..."))

    }

    override func viewDidAppear(_ animated: Bool) {
        service.fetchList(username: "lysonjeada") { result in
            do {
                let repositories = try result.get()
                let models = repositories.map { RepositoryCellModel(name: $0.name, owner: $0.owner.login) }
                DispatchQueue.main.async {
                    self.listView.updateView(with: models)
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }

    override func loadView() {
        self.view = emptyView
    }
    
}
