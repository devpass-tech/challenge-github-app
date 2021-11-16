//
//  SettingsView.swift
//  OnboardingChallenge
//
//  Created by Desenvolvimento on 16/11/21.
//

import UIKit

class SettingsView: UIView {

    let cell = "cell"
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cell)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .systemGray5
        return tableView
    }()

    override init(frame:CGRect = .zero){
        super.init(frame: frame)
        self.addSubview(tableView)
        tableViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableViewConstraints(){
        NSLayoutConstraint.activate([
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}

extension SettingsView: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "APP VERSION"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath)
        cell.textLabel?.text = "Version 1.0"
                
        return cell
    }
    
    
}
