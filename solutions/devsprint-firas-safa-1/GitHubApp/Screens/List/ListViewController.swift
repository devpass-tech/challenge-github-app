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

    private let service = Service()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
        service.fetchList { [weak self] repositories in
            DispatchQueue.main.async {
                self?.listView.viewModel = ListViewModel(listItems: repositories)
            }
        }
    }

    override func loadView() {
        self.view = listView
    }
}
