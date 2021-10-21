//
//  RepositoryCellView.swift
//  OnboardingChallenge
//
//  Created by Thiago Leite on 13/10/21.
//

import UIKit

class RepositoryCellView: UITableViewCell {
    
    //MARK: - Components
   private var wrapperStackView: UIStackView = {
           let stack = UIStackView(frame: .zero)
           stack.translatesAutoresizingMaskIntoConstraints = false
           stack.spacing = 16
           stack.alignment = .center
           return stack
       }()
    
    private var stackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    lazy var userAvatar: UIImageView = {
        let avatar = UIImageView()
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.layer.cornerRadius = 25
        avatar.layer.masksToBounds = true
        avatar.setContentCompressionResistancePriority(.required, for: .horizontal)
        return avatar
    }()
    
    lazy var repositoryName: UILabel = {
        let repoName = UILabel()
        repoName.translatesAutoresizingMaskIntoConstraints = false
        repoName.font = UIFont.boldSystemFont(ofSize: 17)
        return repoName
    }()
    
    lazy var ownerName: UILabel = {
        let ownerName = UILabel()
        ownerName.translatesAutoresizingMaskIntoConstraints = false
        ownerName.textColor = .gray
        ownerName.font = UIFont.systemFont(ofSize: 14)
        return ownerName
    }()
    
    //MARK: - Config
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
        self.configureSubView()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubView() {
        self.addSubview(self.wrapperStackView)
        wrapperStackView.addArrangedSubview(self.userAvatar)
        wrapperStackView.addArrangedSubview(self.stackView)

        stackView.addArrangedSubview(self.repositoryName)
        stackView.addArrangedSubview(self.ownerName)

    }
    
    public func setUpCell(configuration: RepositoryCellViewConfiguration) {
        self.userAvatar.image = configuration.ownerImage
        self.repositoryName.text = configuration.repoName
        self.ownerName.text = configuration.ownerName
    }
    
    //MARK: - Constraints
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.wrapperStackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.wrapperStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.wrapperStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.wrapperStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
            self.userAvatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.userAvatar.widthAnchor.constraint(equalToConstant: 50),
            self.userAvatar.heightAnchor.constraint(equalToConstant: 50),

        ])
    }
}
