//
//  SettingsView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 07/01/22.
//

import UIKit

final class SettingsView: UIView {
    private let settingsViewCellIdentifier = "SettingsViewCellIdentifier"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.settingsViewCellIdentifier)
        tableView.dataSource = self
        return tableView
    }()
    
    struct SettingsSection {
        let title: String
        let values: [String]
    }
    
    private lazy var sections: [SettingsSection] = []
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    func addSection(section: SettingsSection) {
        sections.append(section)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingsView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.sections[section]
        return section.title
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.sections[section]
        return section.values.count
    }

    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.settingsViewCellIdentifier)!
        let section = self.sections[indexPath.section]
        cell.textLabel?.text = section.values[indexPath.row]
        return cell
    }
    
    
}

extension SettingsView:ViewCode {
    func setupSubviews() {
        self.addSubview(self.tableView)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([

            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setupExtraConfiguration() {
        
    }
    
    
}
