//
//  HTTPMethod.swift
//  GitHubApp
//
//  Created by Razee Hussein-Jamal on 09/02/2022.
//

import Foundation

// Type representing `HTTPMethods`
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

struct BaseURL {
    // API endpoint to github api
    static let githubAPI = "api.github.com"
}
