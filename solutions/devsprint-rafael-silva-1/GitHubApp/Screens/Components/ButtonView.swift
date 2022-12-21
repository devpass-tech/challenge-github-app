import UIKit

class ButtonView: UIView {
    
    struct ButtonViewConfiguration {
        let buttonTitle: String
    }
    
    let button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 14
        button.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        return button
    }()
    
    init () {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView () {
        addSubview(button)
    }
    
    func updateView (with configuration: ButtonViewConfiguration) {
        button.setTitle(configuration.buttonTitle, for: .normal)
    }
    
    func constraints () {
        
    }
    
}
