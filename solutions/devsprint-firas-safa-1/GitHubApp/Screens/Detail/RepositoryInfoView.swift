import UIKit

struct RepositoryInfoViewConfiguration {
    let name: String
    let description: String
    let starCount: Int
    let forkCount: Int
}

class RepositoryInfoView: UITableViewCell {
    static let cellIdentifier = "RepositoryInfoView"
    static let cellHeight: CGFloat = 140
    
    private let repoName = UILabel()
    private let repoDescription = UILabel()
    private let subtitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
        setupCellLayout()
        setupCellStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with configuration: RepositoryInfoViewConfiguration) {
        repoName.text = configuration.name
        repoDescription.text = configuration.description
        subtitle.text = "\(configuration.starCount) stars    \(configuration.forkCount) forks"
    }
    
    private func setupSubviews() {
        addSubview(repoName)
        addSubview(repoDescription)
        addSubview(subtitle)
    }
    
    private func setupCellLayout() {
        repoName.sizeToFit()
        repoDescription.sizeToFit()
        subtitle.sizeToFit()
        
        setupCellConstraints()
    }
    
    private func setupCellStyle() {
        repoName.font = .boldSystemFont(ofSize: 15)
        
        repoDescription.font = .systemFont(ofSize: 15)
        repoDescription.numberOfLines = 0
        
        subtitle.font = .systemFont(ofSize: 13)
        subtitle.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
    }
    
    private func setupCellConstraints() {
        repoName.translatesAutoresizingMaskIntoConstraints = false
        repoDescription.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        let paddingConstant: CGFloat = 16
        NSLayoutConstraint.activate([
            repoName.topAnchor.constraint(equalTo: topAnchor, constant: paddingConstant),
            repoName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: paddingConstant),
            repoName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -paddingConstant),
            repoName.heightAnchor.constraint(equalToConstant: 20),
            
            repoDescription.topAnchor.constraint(equalTo: repoName.bottomAnchor, constant: paddingConstant),
            repoDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: paddingConstant),
            repoDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -paddingConstant),
            
            subtitle.topAnchor.constraint(equalTo: repoDescription.bottomAnchor, constant: paddingConstant),
            subtitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: paddingConstant),
            subtitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -paddingConstant),
            subtitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -paddingConstant),
            subtitle.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
