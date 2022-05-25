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

protocol ListViewProtocol: AnyObject {
    func navigationDetail(listItens: String)
}

final class ListView: UIView {

    private let listViewCellIdentifier = "ListViewCellIdentifier"

    private var listItems: [String] = []
    var delegate: ListViewProtocol?

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.listViewCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
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

    func updateView(with repositories: [String]) {

        self.listItems = repositories
        self.tableView.reloadData()
    }
}

extension ListView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.listItems.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: self.listViewCellIdentifier)!
        cell.textLabel?.text = self.listItems[indexPath.row]
        return cell
    }
}

extension ListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.navigationDetail(listItens: listItems[indexPath.row])
    }
}
