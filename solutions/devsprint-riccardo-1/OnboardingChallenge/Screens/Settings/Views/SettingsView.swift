//
//  SettingsViewConfiguration.swift
//  OnboardingChallenge
//
//  Created by Strawberry Pie on 12/14/21.
//

import UIKit

final class SettingsView: UIView {
    private let settingsViewCellIdentifier = "SettingsViewCellIdentifier"
    private let titleForHeader = "APP VERSION"
    private let numberOfRows = 1

    private var displayed: SettingsViewConfiguration.DisplayedSettings?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.settingsViewCellIdentifier)
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

private extension SettingsView {
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

extension SettingsView {
    func updateView(with configuration: SettingsViewConfiguration.Get.ViewModel) {
        self.displayed = configuration.displayed
        self.tableView.reloadData()
    }
}

extension SettingsView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: self.settingsViewCellIdentifier)!
        cell.textLabel?.text = self.displayed?.item
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleForHeader
    }
}


#if DEBUG
import SwiftUI

struct SettingsView_Preview: PreviewProvider {
    static var previews: some View {
        return SwiftUIPreView { context in
            let sv = SettingsView()
            let displayed = SettingsViewConfiguration.DisplayedSettings(item: "Version 1.0")
            let viewModel = SettingsViewConfiguration.Get.ViewModel(displayed: displayed)
            sv.updateView(with: viewModel)
            return sv
        }
    }
}
#endif
