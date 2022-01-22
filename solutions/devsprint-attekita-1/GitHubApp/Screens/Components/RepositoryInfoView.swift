
import UIKit

struct RepositoryInfoViewConfiguration {
    let repositoryName: String
    let repositoryDescription: String
    let repositoryStars: Int
    let repositoryForks: Int
}

final class RepositoryInfoView: UIView, ViewCodable {
    
    private lazy var verticalStack: UIStackView = {
        let view  = UIStackView(arrangedSubviews: [repositoryName, repositoryDescription, repositoryNumberStarsForks])
        view.alignment = .fill
        view.spacing = 8
        view.axis = .vertical
        view.distribution = .fillProportionally
        return view
    }()
    
    private lazy var repositoryName: UILabel = {
        let view  = UILabel(frame: .zero)
        view.textColor = .black
        view.textAlignment = .left
        view.font = UIFont(name: "Verdana-Bold", size: 22)
        return view
    }()
    
    private lazy var repositoryDescription: UILabel = {
        let view  = UILabel(frame: .zero)
        view.textColor = .black
        view.textAlignment = .left
        view.numberOfLines = -1
        view.font = UIFont(name: "Verdana", size: 14)
        return view
    }()
    
    private lazy var repositoryNumberStarsForks: UILabel = {
        let view  = UILabel(frame: .zero)
        view.textColor = .lightGray
        view.textAlignment = .left
        view.numberOfLines = 1
        view.font = UIFont(name: "Verdana", size: 10)
        return view
    }()
    
    override init(frame:CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        addSubview(verticalStack)
    }
    
    func setupConstraints() {
        verticalStack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        verticalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        verticalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        verticalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        repositoryName.topAnchor.constraint(equalTo: verticalStack.topAnchor, constant: 4).isActive = true
        repositoryName.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor, constant: 8).isActive = true
        repositoryName.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor, constant: -8).isActive = true
        repositoryName.translatesAutoresizingMaskIntoConstraints = false
        
        repositoryDescription.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor, constant: 8).isActive = true
        repositoryDescription.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor, constant: -8).isActive = true
        repositoryDescription.translatesAutoresizingMaskIntoConstraints = false
        
        repositoryNumberStarsForks.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor, constant: 8).isActive = true
        repositoryNumberStarsForks.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor, constant: -8).isActive = true
        repositoryNumberStarsForks.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func updateView(with configuration: RepositoryInfoViewConfiguration) {
        repositoryName.text = configuration.repositoryName
        repositoryDescription.text = configuration.repositoryDescription
        repositoryNumberStarsForks.text = "\(configuration.repositoryStars)" + " estrelas " + "\(configuration.repositoryForks)" + " bifurcações"
    }
}
