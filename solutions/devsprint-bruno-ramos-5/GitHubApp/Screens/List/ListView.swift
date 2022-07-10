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

protocol ListViewProtocol {
    func updateView(with repositories: [String])
}

protocol ListViewDelegate: AnyObject {
    func navigationToDetail(listItem: String)
}

final class ListView: UIView {
    
    private lazy var licenseView: LicenseView = {
        let licenseView = LicenseView()
        licenseView.translatesAutoresizingMaskIntoConstraints = false
        return licenseView
    }()

    private lazy var listSearchBar: UISearchBar = {
        let listSearchBar = UISearchBar()
        listSearchBar.placeholder = "Type a GitHub user name"
        listSearchBar.translatesAutoresizingMaskIntoConstraints = false
        return listSearchBar
    }()

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.listViewCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: Delegate
    weak var delegate: ListViewDelegate?
    
    // MARK: private properties
    
    private let listViewCellIdentifier = "ListViewCellIdentifier"
    private var listItems: [String] = []
    
    init() {
        super.init(frame: .zero)
        self.setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListView: ViewCode {
    func setupSubviews() {
        self.addSubview(self.listSearchBar)
        self.addSubview(self.tableView)
        self.addSubview(self.licenseView)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.listSearchBar.bottomAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.listSearchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.listSearchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.listSearchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.licenseView.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: -720),
            self.licenseView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            self.licenseView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8)
        ])
    }
    
    func setupExtraConfiguration() {
        self.backgroundColor = .systemBackground
    }
}

extension ListView: ListViewProtocol {

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
        self.delegate?.navigationToDetail(listItem: listItems[indexPath.row])
    }
}
