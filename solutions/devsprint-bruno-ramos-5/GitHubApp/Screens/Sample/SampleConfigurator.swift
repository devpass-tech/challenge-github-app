import UIKit

enum SampleConfigurator {
    static func make() -> UIViewController {
        let localDataSource = Service()
        let service = SampleService(dataSource: localDataSource)
        let customView = SampleView()
        let viewController = SampleViewController(service: service, customView: customView)
        return viewController
    }
}
