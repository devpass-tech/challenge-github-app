import UIKit

class EmptyView: UIView {
    struct EmptyViewConfiguration {
        let noRepositoriesLabel: String
        let searchForUsersLabel: String
    }
    
    let noRepositoriesLabel: UILabel = {
        let label = UILabel()
        label.text = "No repositories found"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let searchForUsersLabel: UILabel = {
        let label = UILabel()
        label.text = "Search for users to see their public repositories here!"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor(red: 142, green: 142, blue: 147)
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(stackView)
        stackView.addArrangedSubview(noRepositoriesLabel)
        stackView.addArrangedSubview(searchForUsersLabel)
    }
    
    func constraints() {
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 46),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 46)
        ])
    }
    
    func updateView(with configuration: EmptyViewConfiguration){
        noRepositoriesLabel.text = configuration.noRepositoriesLabel
        searchForUsersLabel.text = configuration.searchForUsersLabel
    }
}
