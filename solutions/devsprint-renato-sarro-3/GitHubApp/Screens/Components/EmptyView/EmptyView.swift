//
//  EmptyView.swift
//  GitHubApp
//
//  Created by Tatiana Rico on 23/05/22.
//

import UIKit

class EmptyView: UIView {
    
    private var title: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.text = StringsHelper.TEXT_EMPTYVIEW
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        lb.textAlignment = .center
        lb.numberOfLines = 0
        return lb
    }()
    
    private var texto: UILabel = {
        let lb = UILabel()
        lb.textColor = .gray
        lb.text = StringsHelper.TITLE_EMPTYVIEW
        lb.font = UIFont.systemFont(ofSize: 13)
        lb.textAlignment = .center
        lb.numberOfLines = 0
        return lb
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureText(_ texto: String?, _ subTitle: String?) {
        self.texto.text = texto
        self.title.text = subTitle
    }
}

private extension EmptyView {
    func setupViews() {
        self.backgroundColor = .white
        
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }
    
    func configureSubviews() {
        addSubview(stackView)
        self.stackView.addArrangedSubview(title)
        self.stackView.addArrangedSubview(texto)
    }
    
    func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            self.stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            self.stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
        ])
    }
}
