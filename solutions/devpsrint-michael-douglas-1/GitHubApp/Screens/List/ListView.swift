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

    // MARK: - Private Properties

    private var listItems: [String] = []

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

    func updateView(with configuration: ListViewController.Configuration) {

        self.listItems = configuration.listItems
        self.tableView.reloadData()
    }
}

extension ListView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.listItems.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryCellView.classIdentifier(), for: indexPath) as? RepositoryCellView else {
            return .init()
        }
        cell.updateView(with: .init(title: self.listItems[indexPath.row], authorName: "rdgborges"))
        return cell
    }
}

