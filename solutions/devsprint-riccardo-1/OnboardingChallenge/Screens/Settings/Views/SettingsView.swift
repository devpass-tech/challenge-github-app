// Copyright © 2021 Bending Spoons S.p.A. All rights reserved.

import UIKit

final class SettingsView: UIView {
  private var viewModel: [SettingsViewModel] = []

  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.Identifier)
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

extension SettingsView {
  private func customizeInterface() {
    self.backgroundColor = .white

    self.configureSubviews()
    self.configureTableView()
    self.configureSubviewsConstraints()
  }

  private func configureSubviews() {
    self.addSubview(self.tableView)
  }

  private func configureTableView() {
    self.tableView.dataSource = self
    self.tableView.delegate = self
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

extension SettingsView {
  func updateView(with viewModel: [SettingsViewModel]) {
    self.viewModel = viewModel
    self.tableView.reloadData()
  }
}

extension SettingsView: UITableViewDataSource {
  func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.viewModel[section].items.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let lists = self.viewModel[indexPath.section]
    guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.Identifier) as? SettingsCell
    else {
      fatalError("Dequeue reuseable cell failed while casting")
    }
    let item = lists.items[indexPath.row]
    cell.updateView(with: item)

    return cell
  }

  func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
    return self.viewModel[section].title.value
  }
}

extension SettingsView: UITableViewDelegate {}

#if DEBUG
  import SwiftUI

  struct SettingsViewPreview: PreviewProvider {
    static var previews: some View {
      return SwiftUIPreView { _ in
        let sv = SettingsView()
        let viewModel = SettingsViewModel(title: .appVersion, items: ["Version 1.0"])
        sv.updateView(with: [viewModel])
        return sv
      }
    }
  }
#endif
