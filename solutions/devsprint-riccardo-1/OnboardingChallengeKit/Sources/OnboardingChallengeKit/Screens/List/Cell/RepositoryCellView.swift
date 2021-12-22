//
//  RepositoryCellView.swift
//  OnboardingChallenge
//
//  Created by Mateus Nazário Coelho on 16/12/21.
//

import UIKit

class RepositoryCellView: UITableViewCell {
    // MARK: Properties
    static let reuseIdentifier = "RepositoryCellView"
    
    // MARK: Outlets
    private lazy var labelRepositoryName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelRepositoryOwnerName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    func updateView(with configuration: RepositoryCellViewConfiguration) {
        labelRepositoryName.text = configuration.repositoryName
        labelRepositoryOwnerName.text = configuration.repositoryOwnerName
    }
    
    func setupViews() {
        configureSubViews()
        configureConstraints()
        configureCellStyle()
    }
    
    func configureSubViews() {
        contentView.addSubview(labelRepositoryName)
        contentView.addSubview(labelRepositoryOwnerName)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            labelRepositoryName.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            labelRepositoryName.leadingAnchor.constraint(equalTo: self.readableContentGuide.leadingAnchor, constant: 15),
            labelRepositoryOwnerName.topAnchor.constraint(equalTo: labelRepositoryName.topAnchor, constant: 25),
            labelRepositoryOwnerName.leadingAnchor.constraint(equalTo: labelRepositoryName.leadingAnchor)
        ])
    }
    
    func configureCellStyle() {
        selectionStyle = .none
        accessoryType = .disclosureIndicator
    }
}

#if DEBUG
  import SwiftUI
  // swiftlint:disable type_name
  struct RepositoryCellView_Preview: PreviewProvider {
    static var previews: some View {
      return SwiftUIPreView { _ in
        let rcv = RepositoryCellView()
          rcv.updateView(with: RepositoryCellViewConfiguration(repositoryName: "hereminders-ios", repositoryOwnerName: "rdgborges"))
        return rcv
      }
    }
  }
  // swiftlint:enable type_name
#endif
