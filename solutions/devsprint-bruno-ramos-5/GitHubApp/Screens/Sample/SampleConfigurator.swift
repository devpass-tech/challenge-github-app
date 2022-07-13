import UIKit

enum SampleConfigurator {
    static func make() -> UIViewController {
        let network = NetworkManager()
        let localDataSource = SampleApiDataSource(network: network)
        let service = SampleService(dataSource: localDataSource)
        let customView = SampleView()
        let viewController = SampleViewController(service: service, customView: customView)
        return viewController
    }
}
