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
}
