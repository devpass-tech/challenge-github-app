//
//  ListView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import UIKit

struct ListViewConfiguration {
  
  let listItems: [RepositoryCellModel]
}

final class ListView: UIView {
  
  private var listItems: [RepositoryCellModel] = []
  
  private lazy var tableView: UITableView = {
    
    let tableView = UITableView(frame: .zero)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(RepositoryCellView.self, forCellReuseIdentifier: RepositoryCellView.cellIdentifier)
    tableView.dataSource = self
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
  
  func updateView(with repositories: [RepositoryCellModel]) {
    
    self.listItems = repositories
    self.tableView.reloadData()
  }
}

extension ListView: UITableViewDataSource {
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return self.listItems.count
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryCellView.cellIdentifier) as! RepositoryCellView
      if indexPath.row < listItems.count {
          let item = listItems[indexPath.row]
          cell.updateView(with: item)
      }
    return cell
  }
}
