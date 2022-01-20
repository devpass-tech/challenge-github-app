//
//  ListViewCell.swift
//  GitHubApp
//
//  Created by Rogerio Cardoso Filho on 18/01/22.
//

import UIKit

class RepositoryCellView: UITableViewCell {

    // MARK: - View Properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = .zero
        return label
    }()

    private lazy var authorNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(authorNameLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { nil }

    // MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        authorNameLabel.text = ""
    }

    // MARK: - Internal Methods

    func updateView(with configuration: RepositoryCellView.Configuration) {
        self.titleLabel.text = configuration.title
        self.authorNameLabel.text = configuration.authorName
    }

    // MARK: - Private Methods

    private func setup() {
        contentView.addSubview(contentStackView)

        NSLayoutConstraint.activate([
            self.contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            self.contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            self.contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            self.contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}

// MARK: - Configuration

extension RepositoryCellView {

    struct Configuration {
        let title: String
        let authorName: String
    }
}
