//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {
    
    private func configureNavBar(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Repositories"
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = .white
            
            self.navigationController?.navigationBar.standardAppearance = navBarAppearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        } else {
            self.navigationController?.edgesForExtendedLayout = []
        }
    }
    
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
    
    override func viewDidLoad() {
        configureNavBar()
        
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
