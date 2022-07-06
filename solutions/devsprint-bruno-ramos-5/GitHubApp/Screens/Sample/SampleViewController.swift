import UIKit

final class SampleViewController: UIViewController {

    private let service: SampleServiceProtocol
    private let customView: SampleViewProtocol & UIView

    init(service: SampleServiceProtocol, customView: SampleViewProtocol & UIView) {
        self.service = service
        self.customView = customView
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        service.fetchRepositories { [weak self] _ in
            self?.customView.display()
        }
    }
}
