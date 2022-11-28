//
//  ListView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import UIKit

struct ListViewConfiguration {

    let listItems: [String]
}

final class ListView: UIView {

    private let listViewCellIdentifier = "ListViewCellIdentifier"

    private var listItems: [GitHubApp] = []
        
    var loadingView: LoadingView?

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.listViewCellIdentifier)
        tableView.dataSource = self
        tableView.register(RepositoryCellView.self, forCellReuseIdentifier: RepositoryCellView.classIdentifier())
        return tableView
    }()

    init() {

        super.init(frame: .zero)

        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ListView {

    func setupViews() {

        self.backgroundColor = .white

        self.configureSubviews()
        self.configureSubviewsConstraints()
    }

    func configureSubviews() {

        self.addSubview(self.tableView)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([

            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension ListView {

    func updateView(with repositories: [GitHubApp]) {
        DispatchQueue.main.async {
            self.listItems = repositories
            self.tableView.reloadData()
        }
    }
    
    func showEmptyView() {
        let emptyView = EmptyView(frame: self.frame)
        emptyView.updateView(with: EmptyViewConfiguration(labelText: "erro", labelText2: "algo deu errado"))
        //emptyView.isHidden = true
        self.tableView.addSubview(emptyView)
    }
    
    func showLoadingView(){
        if loadingView == nil {
            loadingView = LoadingView(frame: self.tableView.frame)
            self.tableView.addSubview(loadingView ?? UIView())
        }
        
        loadingView?.isHidden = false
        self.loadingView?.updateView(with: LoadingViewConfiguration(labelText: "carregando"))
    }
    
    func hideLoadingView() {
        DispatchQueue.main.async {
            self.loadingView?.isHidden = true
        }
    }
}

extension ListView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.listItems.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryCellView.classIdentifier()) as? RepositoryCellView
        
        let item = listItems[indexPath.row]

        cell?.updateView(with: RepositoryCellViewConfiguration(title: item.name, subtitle: String(item.watchersCount)))
        return cell ?? UITableViewCell()
    }
}

