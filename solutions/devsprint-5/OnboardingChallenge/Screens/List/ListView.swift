//
//  ListView.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 30/09/21.
//

import UIKit

final class ListView: UIView{

    private let listViewCellIdentifier = "ListViewCellIdentifier"
    weak var listViewController: ListViewController?

    private var listItems: [Repository] = []
    
    let loading: LoadingView = {
        let loading = LoadingView()
        loading.isHidden = true
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.updateView(configuration: LoadingViewConfiguration(title: "Searching repositories..."))
       return loading
   }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RepositoryCellView.self, forCellReuseIdentifier: RepositoryCellView.classIdentifier())
        tableView.dataSource = self
        tableView.delegate = self
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
        self.addSubview(self.loading)
    }

    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.loading.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.loading.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.loading.topAnchor.constraint(equalTo: self.topAnchor),
            self.loading.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension ListView {
    func updateView(with configuration: ListViewConfiguration) {
        self.listItems = configuration.listItems
        self.tableView.reloadData()
    }

    public func showLoading() {
        tableView.isHidden = true
        loading.isHidden = false
    }

    public func hideLoading() {
        loading.isHidden = true
        tableView.isHidden = false
    }
}

extension ListView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listItems.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: RepositoryCellView.classIdentifier()
        ) as? RepositoryCellView else {
            return UITableViewCell()
        }
        
        let repository = listItems[indexPath.row]
        cell.updateView(with: RepositoryCellViewModel(name: repository.name, ownerUsername: repository.owner.login))
        return cell
    }

}

extension ListView: UITableViewDelegate {
	
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listViewController?.navigateToDetail()
    }
    
}
