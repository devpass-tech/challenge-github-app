import UIKit

final class ButtonView: UIView, ViewCode {
    private lazy var button: UIButton = {
        let element = UIButton()
        element.configuration = .filled()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.configuration?.imagePadding = 8
        element.layer.cornerRadius = CGFloat(10)
        
        return element
    }()
    
    struct ButtonViewConfiguration {
        let buttonText: String
    }
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func updateView(with configuration: ButtonViewConfiguration) {
        button.setTitle(configuration.buttonText, for: .normal) 
    }
    
    func setupSubviews() {
        self.addSubview(button)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func setupExtraConfiguration() {
    }
    
}
