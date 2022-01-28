//
//  ListView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import UIKit

protocol ListViewDelegate: AnyObject {
    func navigateToDetail(title: String)
}

final class ListView: UIView {

    private let listViewCellIdentifier = "ListViewCellIdentifier"

    private var listItems: [GitHubApp] = []

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RepositoryCellView.self, forCellReuseIdentifier: RepositoryCellView.classIdentifier())
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private var loadingView: LoadingView = {
        let view = LoadingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    weak var delegate: ListViewDelegate?
    
    init() {

        super.init(frame: .zero)

        self.customizeInterface()
        
        self.loadingView.updateView(with: LoadingViewConfiguration.init(labelText: "Searching repositories..."))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ListView {

    func customizeInterface() {

        self.backgroundColor = .white

        self.configureSubviews()
        self.configureSubviewsConstraints()
    }

    func configureSubviews() {
        self.addSubview(self.tableView)
        self.addSubview(self.loadingView)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([

            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.loadingView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.loadingView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.loadingView.topAnchor.constraint(equalTo: self.topAnchor),
            self.loadingView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension ListView {

    func updateView(with configuration: ListViewConfiguration) {
        
        switch configuration {
        case .empty:
            showEmptyView()
        case .loading:
            showLoadingView()
        case .list(let list):
            showRepositoryList(list: list)
        }
        
        func showRepositoryList(list: [GitHubApp]) {
            self.listItems = list
            self.tableView.reloadData()
            self.tableView.isHidden = false
            self.loadingView.isHidden = true
        }
        
        func showLoadingView() {
            self.loadingView.isHidden = false
            self.tableView.isHidden = true
        }
        
        func showEmptyView(){
            
        }
    }
}

extension ListView: UITableViewDataSource, UITableViewDelegate {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.listItems.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryCellView.classIdentifier()) as? RepositoryCellView
        cell?.updateView(with: RepositoryCellViewConfiguration(title: self.listItems[indexPath.row].name, subtitle: self.listItems[indexPath.row].owner.login))
        return cell ?? UITableViewCell()

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.navigateToDetail(title: self.listItems[indexPath.row].name)
    }
}

