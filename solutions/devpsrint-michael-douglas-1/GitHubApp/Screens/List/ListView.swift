//
//  ListView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import UIKit

final class ListView: UIView {

    // MARK: - View Properties

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RepositoryCellView.self, forCellReuseIdentifier: RepositoryCellView.classIdentifier())
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 70
        tableView.dataSource = self
        return tableView
    }()
    
    private lazy var emptyView: EmptyView = {
        let emptyView = EmptyView()
        let emptyViewConfiguration = EmptyViewConfiguration(title: "No repositories found",
                                                            subTitle: "Search for users to see their public repositories here!")
        emptyView.updateView(with: emptyViewConfiguration)
        return emptyView
    }()

    // MARK: - Private Properties

    private var repositories: [Repository] = []

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        self.customizeInterface()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

private extension ListView {

    func customizeInterface() {
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

    func updateView(with configuration: ListViewConfiguration) {
        self.repositories = configuration.repositories
        self.tableView.reloadData()
    }
}

extension ListView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = self.repositories.count > 0 ? UIView() : emptyView
        return self.repositories.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryCellView.classIdentifier(), for: indexPath) as? RepositoryCellView else {
            return .init()
        }
        let repository = self.repositories[indexPath.row]
        cell.updateView(with: .init(title: repository.name, authorName: repository.owner.login))
        
        return self.repositories.count

    }
}
