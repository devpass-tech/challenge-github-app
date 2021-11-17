//
//  ViewController.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController {


    private var emptyView: UIView {
        
        let view = EmptyView()
        
        return view
        
}
    
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

        _ = EmptyViewConfiguration(title: "No repositories found" , subtitle: "Search for users to see their public repositories here!")
        
        
        self.view = self.emptyView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.fetchList()
    }

    private func fetchList() {

        self.service.fetchList { items in

            let configuration = ListViewConfiguration(listItems: items)

            self.listView.updateView(with: configuration)
        }
    }
}

