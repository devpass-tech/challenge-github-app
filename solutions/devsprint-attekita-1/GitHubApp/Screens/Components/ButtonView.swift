//
//  ButtonView.swift
//  GitHubApp
//
//  Created by Pedro Boga on 21/01/22.
//

import UIKit

struct ButtonViewConfiguration {
    var title: String
    var link: String
}

protocol ButtonViewDelegate: AnyObject {
    func openURL()
}

final class ButtonView: UIView {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(callAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var url = String()
    
    weak var delegate: ButtonViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with configuration: ButtonViewConfiguration) {
        button.setTitle(configuration.title, for: .normal)
        url = configuration.link
    }
    
    @objc private func callAction() {
        if let url = URL(string: url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
