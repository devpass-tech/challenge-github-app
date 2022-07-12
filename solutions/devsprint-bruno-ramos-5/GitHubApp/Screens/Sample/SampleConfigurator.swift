import UIKit

enum SampleConfigurator {
    static func make() -> UIViewController {
        let localDataSource = SampleApiDataSource()
        let service = SampleService(dataSource: localDataSource)
        let customView = SampleView()
        let viewController = SampleViewController(service: service, customView: customView)
        return viewController
    }
}
