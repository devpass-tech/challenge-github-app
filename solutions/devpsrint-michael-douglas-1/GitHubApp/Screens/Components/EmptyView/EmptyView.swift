//
//  EmptyView.swift
//  GitHubApp
//
//  Created by Gustavo Rocha on 20/01/22.
//

import UIKit

final class EmptyView: UIView {

    // MARK: Properties
    private lazy var stackLabels: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .white
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: Initialization
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    private func setupUI() {
        backgroundColor = .green
    }
}
