//
//  HTTPPath.swift
//  GitHubApp
//
//  Created by Razee Hussein-Jamal on 09/02/2022.
//

import Foundation

struct HTTPPath: RawRepresentable {
    let rawValue: String

    static let USER = HTTPPath(rawValue: "/user")
    static let REPOS = HTTPPath(rawValue: "/repos")
    
    init?(rawValue: String) {
        self.rawValue = rawValue
    }
}

struct URLHost: RawRepresentable {
    let rawValue: String

    static let GITHUB = "api.github.com"
    
    init?(rawValue: String) {
        self.rawValue = rawValue
    }
}
