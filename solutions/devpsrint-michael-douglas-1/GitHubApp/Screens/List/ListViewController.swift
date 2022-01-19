//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {

    private lazy var listView: ListView = {

        return ListView()
    }()

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
        
        self.fetchList()
        
        self.UserList()
    }

    private func fetchList() {

        self.service.repositoryList { items in

            let configuration = RepositoryCellViewConfiguration(repositoryItens: items)

            self.listView.updateView(with: configuration)
        }
    }
    
    private func UserList(){
        
        self.service.repositoryUser { users in
            
            let userConfiguration = RepositoryCellViewUser(repositoryUserList: users)
            
            self.listView.updateUser(with: userConfiguration)
            
        }
        
    }
}


