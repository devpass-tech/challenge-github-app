//
//  ListView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import UIKit

final class ListView: UIView {

    private let listViewCellIdentifier = "ListViewCellIdentifier"

    private var listItems: [String] = []
    
    private var repositoryUser: [String] = []

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RepositoryCellView.self, forCellReuseIdentifier: RepositoryCellView.reuseIdentifier)
        tableView.rowHeight = 70
        tableView.estimatedRowHeight = 70
        tableView.dataSource = self
        return tableView
    }()

    init() {

        super.init(frame: .zero)

        self.customizeInterface()
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

    func updateView(with configuration: RepositoryCellViewConfiguration) {

        self.listItems = configuration.repositoryItens
        
        self.tableView.reloadData()
    }
    
    func updateUser(with configuration: RepositoryCellViewUser) {
        
        self.repositoryUser = configuration.repositoryUserList
        
        self.tableView.reloadData()
        
    }
    
    
}

extension ListView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.listItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryCellView.reuseIdentifier, for: indexPath) as? RepositoryCellView else {
            return .init()
        }
        
        cell.repositoryLabel.text = self.listItems[indexPath.row]

        cell.nameLabel.text = self.repositoryUser[indexPath.row]
           
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}

extension UITableViewCell {
    
    static var reuseIdentifier: String {
        
        String(describing: self)
        
    }
    
}
