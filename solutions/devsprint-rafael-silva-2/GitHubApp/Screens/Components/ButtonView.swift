//
//  ButtonView.swift
//  GitHubApp
//
//  Created by user on 11/01/23.
//

import Foundation
import UIKit

class ButtonView: UIView {
    let button : UIButton={
        let button = UIButton()
        button.setTitle("See Profile", for: .normal)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 25
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(self, action: #selector(ButtonAction), for: .touchUpInside)
        return button
    }()
    init () {
        super.init(frame: .zero)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(button)
    }
    
}
