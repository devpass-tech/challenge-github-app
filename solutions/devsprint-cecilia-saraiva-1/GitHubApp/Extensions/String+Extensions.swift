//
//  String+Extensions.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 06/10/21.
//

import Foundation

extension String {
    
    static func repositoryInfo(repositoriesCount: Int, bifurcationsCount: Int) -> String {
        
        return "\(repositoriesCount) stars   \(bifurcationsCount) bifurcations"
    }
    
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: "*\(self)*", comment: "")
    }
    
    func localized(with args: [String], bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        let format = NSLocalizedString(self, tableName: tableName, bundle: bundle, value: self, comment: "")
        return String(format: format, arguments: args)
    }
}
