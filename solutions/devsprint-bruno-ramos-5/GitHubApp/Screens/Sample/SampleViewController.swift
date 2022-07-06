import UIKit

final class SampleViewController: UIViewController {

    private let service: SampleService = SampleService()
    private let customView = SampleView()

    init() {
        super.init(nibName: nil, bundle: nil)
        view = customView
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        service.fetchRepositories { [weak self] _ in
            self?.customView.display()
        }
    }
}
