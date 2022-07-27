
import Foundation

protocol ViewConfiguration: AnyObject {
    func setupViews()
    func configViews()
    func buildViews()
    func setupConstraints()
}

extension ViewConfiguration {
    func setupViews() {
        self.configViews()
        self.buildViews()
        self.setupConstraints()
    
    }
}
