import UIKit

struct RepositoryCellViewConfiguration {
     init(title: String, subtitle: String, accessoryType: UITableViewCell.AccessoryType = .disclosureIndicator) {
        self.title = title
        self.subtitle = subtitle
        self.accessoryType = accessoryType
    }
    
    let title: String
    let subtitle: String
    let accessoryType: UITableViewCell.AccessoryType
}

class RepositoryCellView: UITableViewCell {
    static let cellIdentifier = RepositoryCellView.classIdentifier()
    static let repositoryCellHeight: CGFloat = 70
    
    func setupCell(with configuration: RepositoryCellViewConfiguration) {
        mainTitle.text = configuration.title
        subTitle.text = configuration.subtitle
        accessoryType = configuration.accessoryType
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
        setupSubviewsConstraints()
        setupSubviewsStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let mainTitle = UILabel()
    private let subTitle = UILabel()

    private func setupSubviews() {
        addSubview(mainTitle)
        addSubview(subTitle)
    }
    
    private func setupSubviewsStyle() {
        mainTitle.font = .boldSystemFont(ofSize: 15)
        mainTitle.sizeToFit()
        
        subTitle.font = .systemFont(ofSize: 13)
        subTitle.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        subTitle.sizeToFit()
    }
    
    private func setupSubviewsConstraints() {
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        
        let paddingConstant: CGFloat = 16
        NSLayoutConstraint.activate([
            mainTitle.topAnchor.constraint(equalTo: topAnchor, constant: paddingConstant),
            mainTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: paddingConstant),
            mainTitle.trailingAnchor.constraint(equalTo: trailingAnchor),   
            
            subTitle.topAnchor.constraint(equalTo: mainTitle.bottomAnchor),
            subTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: paddingConstant),
            subTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            subTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -paddingConstant),
        ])
    }
}
