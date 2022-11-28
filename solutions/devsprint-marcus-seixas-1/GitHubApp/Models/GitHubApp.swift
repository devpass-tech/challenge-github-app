//
//  GitHubApp.swift
//  GitHubApp
//
//  Created by Marcus Vinicius Seixas on 28/11/22.
//

import Foundation

struct GitHubApp: Codable {
    var name: String
    var description: String?
    var stargazersCount: Int
    var watchersCount: Int
    var owner: Owner
}

struct Owner: Codable {
    var login: String
    var avatarUrl: String
    var type: String
}
