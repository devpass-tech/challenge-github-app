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
    var viewModel: ListViewModel {
        didSet { update() }
    }
    
    private  var tableView = UITableView()

    init(viewModel: ListViewModel = ListViewModel()) {
        self.viewModel = viewModel
        
        super.init(frame: .zero)
        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ListView {
    private func update() {
        tableView.reloadData()
    }
    
    private func setupViews() {
        backgroundColor = .white

        configureTableView()
        configureSubviews()
        configureSubviewsConstraints()
    }
    
    private func configureTableView() {
        tableView.register(RepositoryCellView.self, forCellReuseIdentifier: RepositoryCellView.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func configureSubviews() {
        self.addSubview(self.tableView)
    }

    private func configureSubviewsConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension ListView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.rowCount
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryCellView.cellIdentifier, for: indexPath) as? RepositoryCellView else {
            fatalError("Couldn't dequeue reusable cell with identifier \(RepositoryCellView.cellIdentifier)")
        }
        
        cell.setupCell(with: viewModel.getCellFor(indexPath.row))
        return cell
    }
}

extension ListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        RepositoryCellView.repositoryCellHeight
    }
}
