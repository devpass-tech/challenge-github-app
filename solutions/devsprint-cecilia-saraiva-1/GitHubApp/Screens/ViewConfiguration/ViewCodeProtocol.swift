
import Foundation

protocol ViewConfiguration: AnyObject {
    func setupViews()
    func configureViews()
    func buildViews()
    func setupConstraints()
}

extension ViewConfiguration {
    func setupViews() {
        self.configureViews()
        self.buildViews()
        self.setupConstraints()

    }
}
