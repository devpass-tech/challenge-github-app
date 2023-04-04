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
    
    private let loadingView: LoadingView = {
        let loadingView = LoadingView()
        return loadingView
    }()

    private let service = Service()

    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        showLoadingViewFeedback()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "GitHub App 🐙"
    }

    override func viewDidAppear(_ animated: Bool) {

        service.fetchList { repositories in

            DispatchQueue.main.async {

                self.listView.updateView(with: repositories)
            }
        }

    }

    override func loadView() {
        self.view = listView
    }
}

private extension ListViewController {
    func showLoadingViewFeedback(with configuration: LoadingViewConfiguration? = nil) {
        self.view = loadingView
        loadingView.showLoadingViewTitleLabel()
        loadingView.showLoadingViewSpinnerActivityIndicator()
        
        if let configuration {
            loadingView.updateView(with: configuration)
        }
    }
    
    func hideLoadingViewFeedback() {
        self.view = listView
        loadingView.showLoadingViewTitleLabel()
        loadingView.showLoadingViewSpinnerActivityIndicator()
    }
}
