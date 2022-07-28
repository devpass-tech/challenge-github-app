//
//  RepositoryCellView.swift
//  GitHubApp
//
//  Created by Pierre Youness on 26/07/2022.
//

import UIKit


final class RepositoryCellView: UITableViewCell {
    
    static let cellIdentifier = "ListViewCellIdentifier"
    
    private let labelRepositoryName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    private let labelOwner: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.init(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6)
        return label
    }()
    
    private let labelsStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        accessoryType = .disclosureIndicator
        
        labelsStackView.addArrangedSubview(labelRepositoryName)
        labelsStackView.addArrangedSubview(labelOwner)
        contentView.addSubview(labelsStackView)
        
        NSLayoutConstraint.activate([
            self.labelsStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17),
            self.labelsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            self.labelsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16),
            self.labelsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -17)
        ])
    }
    
    func updateView(with configuration: RepositoryCellModel) {
        labelRepositoryName.text = configuration.name
        labelOwner.text = configuration.owner
    }
}
