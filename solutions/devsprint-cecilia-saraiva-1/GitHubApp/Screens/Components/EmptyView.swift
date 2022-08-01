
import Foundation
import UIKit

final class EmptyView: UIView, ViewConfiguration {
  
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "SFProText-Semibolt", size: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var labelSubtitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
        label.font = UIFont(name: "SFProText-Regular", size: 13)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
 
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 15
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    func updateViews(with configuration: EmptyViewConfiguration) {
        labelTitle.text = configuration.title
        
        labelSubtitle.text = configuration.subtitle
        
    }
     
    func buildViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(labelTitle)
        stackView.addArrangedSubview(labelSubtitle)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews() {
        backgroundColor = .white
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 283)
        ])
        
    }
    
}
