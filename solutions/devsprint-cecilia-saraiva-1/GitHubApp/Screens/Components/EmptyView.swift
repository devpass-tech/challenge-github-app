
import Foundation
import UIKit

final class EmptyView: UIView, ViewConfiguration {
   
    func updateView(with configuration: EmptyView) {
    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.text = EmptyViewString.labelTitle.localized
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "SFProText-Semibolt", size: 16)
        label.textAlignment = .center
        label.backgroundColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelSubtitle: UILabel = {
        let label = UILabel()
        label.text = EmptyViewString.labelSubtitle.localized
        label.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
        label.font = UIFont(name: "SFProText-Regular", size: 13)
        label.textAlignment = .center
        label.backgroundColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
        func buildViews() {
            addSubview(stackView)
            stackView.addArrangedSubview(labelTitle)
            stackView.addArrangedSubview(labelSubtitle)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 15
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
      
        return stackView
    }()
    
    func configViews() {
        backgroundColor = .white
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
    }
    
}
