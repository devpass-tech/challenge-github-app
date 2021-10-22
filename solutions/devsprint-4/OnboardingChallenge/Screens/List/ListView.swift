//
//  ListView.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 30/09/21.
//

import UIKit

protocol ClickCellDelegate {
    func segueDetailViewController()
}

final class ListView: UIView {
    
    private let listViewCellIdentifier = "ListViewCellIdentifier"

    private var listItems: [String] = []
    
    var delegate: ClickCellDelegate?
    
    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RepositoryCellView.self, forCellReuseIdentifier: self.listViewCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private lazy var emptyView: EmptyView = {
        let configuration = EmptyViewConfiguration(titleMessage: "No repositories found", emptyMessage: "Search for users to see their public repositories here!")
        let emptyView = EmptyView()
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        emptyView.updateView(with: configuration)
        return emptyView
    }()

    private var loadingView: LoadingView = {

        let loadingView = LoadingView()
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.isHidden = true

        let configuration = LoadingViewConfiguration(message: "Searching repositories...")
        loadingView.updateView(with: configuration)

        return loadingView
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
        self.addSubview(self.emptyView)
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
            self.loadingView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            self.emptyView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.emptyView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.emptyView.topAnchor.constraint(equalTo: self.topAnchor),
            self.emptyView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension ListView {

    func updateView(with configuration: ListViewConfiguration) {
        if configuration.listItems.isEmpty {
            self.tableView.isHidden = true
            self.emptyView.isHidden = false
            
        } else {
            self.emptyView.isHidden = true
            self.tableView.isHidden = false
            self.listItems = configuration.listItems
            self.tableView.reloadData()
        }
    }

    func showLoading() {

        self.loadingView.isHidden = false
    }

    func hideLoading() {

        self.loadingView.isHidden = true
    }
}

extension ListView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.listItems.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: self.listViewCellIdentifier, for: indexPath) as! RepositoryCellView
        
        let cellConfiguration: RepositoryCellViewConfiguration = RepositoryCellViewConfiguration(ownerImage: UIImage(named: "dev")!, repoName: self.listItems[indexPath.row], ownerName: "Owner name")
        
        cell.setUpCell(configuration: cellConfiguration)

        
        return cell
    }
}

extension ListView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.segueDetailViewController()
        
    }

}
