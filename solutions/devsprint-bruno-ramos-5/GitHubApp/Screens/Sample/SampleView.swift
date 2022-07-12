import UIKit

// Template Method

protocol SampleViewProtocol {
    func display()
}

// Fluxo de volta (observer, delegate pattern, etc)

protocol SampleViewDelegate: AnyObject {
    func didTapOnRepository(at index: IndexPath)
}

final class SampleView: UIView {

    // MARK: - UI Components

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello World!"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello World!"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var additionalLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello World!"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tap me!!!", for: .normal)
        button.addTarget(self, action: #selector(didTapOnActionButton), for: .touchUpInside)
        return button
    }()

    weak var delegate: SampleViewDelegate?

    // MARK: - Initializer

    init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Private methods

    @objc
    private func didTapOnActionButton(at index: IndexPath) {
        delegate?.didTapOnRepository(at: index)
    }
}

extension SampleView: SampleViewProtocol {
    func display() {
        titleLabel.text = "Hello World Fetched!"
    }
}

extension SampleView: ViewCode {
    func setupSubviews() {
        addSubview(titleLabel)
    }

    func setupConstraint() {
        setupTitleLabelConstraint()
    }

    private func setupTitleLabelConstraint() {
        NSLayoutConstraint.activate([
             self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 16),
             self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         ])
    }

    private func setupSubtitleLabelConstraint() {
        NSLayoutConstraint.activate([
            self.subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            self.subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         ])
    }

    private func setupAdditionalLabelConstraint() {
        NSLayoutConstraint.activate([
            self.additionalLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 8),
            self.additionalLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.additionalLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         ])
    }

    private func setupActionButtonConstraint() {
        NSLayoutConstraint.activate([
            self.actionButton.topAnchor.constraint(equalTo: additionalLabel.bottomAnchor, constant: 16),
            self.actionButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.actionButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.actionButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
         ])
    }

    func setupExtraConfiguration() {
        backgroundColor = .white
    }
}
