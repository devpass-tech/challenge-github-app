//
//  HTTPPath.swift
//  GitHubApp
//
//  Created by Razee Hussein-Jamal on 09/02/2022.
//

import Foundation

enum HTTPPath: String {
    case user = "/user"
    case repositories = "/repos"
}

enum URLHost: String {
    case github = "api.github.com"
}
