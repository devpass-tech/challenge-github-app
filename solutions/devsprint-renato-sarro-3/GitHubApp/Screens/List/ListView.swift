//
//  ListView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import UIKit

struct ListViewConfiguration {
    let listItems: [RepositoryCellViewConfiguration]
}

final class ListView: UIView {
    
    // MARK: - Properties
    private var listItems: [RepositoryCellViewConfiguration] = []
    
    // MARK: - UI Components
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ListViewCell.self, forCellReuseIdentifier: ListViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    // MARK: - Initializations
    init() {
        super.init(frame: .zero)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension ListView {
    func updateView(with configuration: ListViewConfiguration) {
        self.listItems = configuration.listItems
        self.tableView.reloadData()
    }
}

extension ListView: ViewCode {
    func buildHierarchy() {
        self.addSubview(self.tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setupExtraConfiguration() {
        self.backgroundColor = .white
    }
}

extension ListView: UITableViewDelegate {
    
}

extension ListView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListViewCell.identifier, for: indexPath) as? ListViewCell else {
            return UITableViewCell()
        }
        
        cell.updateView(with: self.listItems[indexPath.row])
    
        return cell
    }
}
