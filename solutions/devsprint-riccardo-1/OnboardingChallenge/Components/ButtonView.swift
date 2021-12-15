//
//  ButtonView.swift
//  OnboardingChallenge
//
//  Created by Pedro Gabriel on 15/12/21.
//

import UIKit

struct ButtonViewConfiguration {
    let title: String
    var pressedButton: (() -> Void)?
}

class ButtonView: UIView, ViewCode {
    // MARK: Properties
    private var pressedButton: (() -> Void)?
    
    private lazy var button: UIButton = {
        var button = UIButton(type: .system)
        
        button.layer.cornerRadius = 15
        button.backgroundColor = .systemBlue
        button.titleLabel?.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 21, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: Initializers
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 65)
    }
    
    // MARK: Actions
    @objc
    private func buttonPressed() {
        pressedButton?()
    }
    
    // MARK: Methods
    func configure(with configuration: ButtonViewConfiguration) {
        pressedButton = configuration.pressedButton
        button.setTitle(configuration.title, for: .normal)
    }
}

// MARK: ViewCode Extensions
extension ButtonView {
    func configureSubviews() {
        addSubview(button)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configureAdditionalBehaviors() {}
}

// MARK: Preview
#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ButtonViewPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let configuration = ButtonViewConfiguration(title: "See profile") {
                print("do Something!")
            }
            let buttonView = ButtonView()
            buttonView.configure(with: configuration)
            return buttonView
        }
        .padding(.horizontal, 15)
        .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 80))
    }
}
#endif
