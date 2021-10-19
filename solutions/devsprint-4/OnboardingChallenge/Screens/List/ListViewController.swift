//
//  ViewController.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController, ClickCellDelegate {
    
    private lazy var listView: ListView = {
        let listView = ListView()
        listView.delegate = self
        return listView
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
        
    }

    private func fetchList() {

        self.service.fetchList { items in

            let configuration = ListViewConfiguration(listItems: items)

            self.listView.updateView(with: configuration)
        }
    }
    
    func segueDetailViewController() {
        let vc = DetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

