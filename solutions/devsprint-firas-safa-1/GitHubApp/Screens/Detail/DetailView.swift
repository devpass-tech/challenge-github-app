//
//  DetailView.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 07/01/22.
//

import UIKit

class DetailView: UIView {
    
    private let ownerView = OwnerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(ownerView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
