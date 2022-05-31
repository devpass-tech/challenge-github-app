//
//  ListViewCell.swift
//  GitHubApp
//
//  Created by Thyago Raphael on 25/05/22.
//

import UIKit

final class ListViewCell: UITableViewCell {
    // MARK: - Properties
    static let identifier = "ListViewCell"
    
    // MARK: - UI Components
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        return stackView
    }()
    
    // MARK: - Inicializations
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    // MARK: - Methods
    func updateView(with configuration: RepositoryCellViewConfiguration) {
        self.nameLabel.text = configuration.name
        self.descriptionLabel.text = configuration.description
    }
}

// MARK: - Extensions
extension ListViewCell: Viewcode {
    func buildHierarchy() {
        addSubview(verticalStackView)
    }
    
    func setupConstraints() {
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    func setupExtraConfiguration() {
        backgroundColor = .white
        selectionStyle = .none
        accessoryType = .disclosureIndicator
    }
}

