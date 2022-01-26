//
//  GitHubApp.swift
//  GitHubApp
//
//  Created by Michelli Cristina de Paulo Lima on 19/01/22.
//

import Foundation

struct GithubApp: Codable {
    var name: String
    var description: String
    var stargazers_count: Int
    var watchers_count: Int
    var owner: Owner
}

struct Owner: Codable {
    var login: String
    var avatar_profile: String
    var avatar_url: String
    var type: String
}

