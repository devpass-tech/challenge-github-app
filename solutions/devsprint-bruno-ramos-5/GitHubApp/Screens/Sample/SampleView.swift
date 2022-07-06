import UIKit

// Template Method

protocol ViewCode {
    func setupSubviews()
    func setupConstraint()
    func setupExtraConfiguration()
    func setup()
}

extension ViewCode {
    func setup() {
        setupSubviews()
        setupConstraint()
        setupExtraConfiguration()
    }
}

protocol SampleViewProtocol {
    func display()
}

final class SampleView: UIView, SampleViewProtocol {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello World!"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    func display() {
        titleLabel.text = "Hello World Fetched!"
    }
}

extension SampleView: ViewCode {
    func setupSubviews() {
        addSubview(titleLabel)
    }

    func setupConstraint() {
        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

    func setupExtraConfiguration() {
        backgroundColor = .white
    }
}
