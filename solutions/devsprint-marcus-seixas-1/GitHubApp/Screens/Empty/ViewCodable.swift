//  ViewCodable.swift
//  GitHubApp
//
//  Created by Rafael Mazzoco on 23/11/22.
//

import Foundation


public protocol ViewCodable {
    
    func buildHierarchy()
    
    func setupConstraints()
    
    func applyAdditionalChanges()
}

//
public extension ViewCodable {
    
    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }
    
    func buildHierarchy() {}
    
    func setupConstraints() {}
    
    func applyAdditionalChanges() {}
}
