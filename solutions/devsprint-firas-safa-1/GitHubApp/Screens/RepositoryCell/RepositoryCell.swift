import UIKit

class RepositoryCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var mainTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    private lazy var subTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        return label
    }()
    
    private func setupCell() {
        
    }

    private func setupCellLayout() {
        addSubview(mainTitle)
        addSubview(subTitle)
        
        NSLayoutConstraint.activate([
            mainTitle.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            mainTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            subTitle.topAnchor.constraint(equalTo: mainTitle.bottomAnchor),
            subTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            subTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            subTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17),
        ])
    }
}
