// Copyright © 2021 DevPass. All rights reserved.

import UIKit

final class ListView: UIView {
  private var listItems: [RepositoryCellViewConfiguration] = []

  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(
      RepositoryCellView.self,
      forCellReuseIdentifier: RepositoryCellView.reuseIdentifier
    )
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 70
    return tableView
  }()

  init() {
    super.init(frame: .zero)

    self.customizeInterface()
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension ListView {
  private func customizeInterface() {
    self.backgroundColor = .white
    self.configureSubviews()
    self.configureSubviewsConstraints()
  }

  private func configureSubviews() {
    self.addSubview(self.tableView)
  }

  private func configureSubviewsConstraints() {
    NSLayoutConstraint.activate([
      self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
      self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
    ])
  }
}

extension ListView {
  func updateView(with configuration: ListViewConfiguration) {
    self.listItems = configuration.listItems
    self.tableView.reloadData()
  }
}

extension ListView: UITableViewDataSource {
  public func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
    return self.listItems.count
  }

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // swiftlint:disable force_cast
    let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryCellView.reuseIdentifier) as! RepositoryCellView
    // swiftlint:enable force_cast
    cell.updateView(with: self.listItems[indexPath.row])
    return cell
  }
}

extension ListView: UITableViewDelegate {
  func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
    return 70
  }
}

#if DEBUG
  import SwiftUI
  // swiftlint:disable type_name
  struct ListView_Preview: PreviewProvider {
    static var previews: some View {
      return SwiftUIPreView { _ in
        let lv = ListView()
        lv.updateView(with: .init(listItems: [
          RepositoryCellViewConfiguration(repositoryName: "hereminders-ios", repositoryOwnerName: "rdgborges"),
          RepositoryCellViewConfiguration(repositoryName: "hereminders-ios", repositoryOwnerName: "mateusnazarioc"),
        ]))
        return lv
      }
    }
  }
  // swiftlint:enable type_name
#endif
