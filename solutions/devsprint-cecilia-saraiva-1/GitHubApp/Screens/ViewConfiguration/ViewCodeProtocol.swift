
import Foundation

protocol ViewConfiguration: AnyObject {
    func setupViews()
    func configViews()
    func buidView()
    func setupConstraints()
    func updateView()
}

extension ViewConfiguration {
    func setupViews() {
        self.configViews()
        self.setupConstraints()
        self.updateView()
    
    }
}
