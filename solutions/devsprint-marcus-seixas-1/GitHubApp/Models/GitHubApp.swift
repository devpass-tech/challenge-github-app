//
//  GitHubApp.swift
//  GitHubApp
//
//  Created by Rafael Mazzoco on 01/12/22.
//

import Foundation

struct GitHubApp: Codable {
    var name: String
    var description: String?
    var stargazersCount: Int
    var watcherCount: Int
    var owner: Owner
}

struct Owner: Codable {
    var login: String
    var avatarUrl: String
    var type: String
}
