//
//  GitHubApp.swift
//  GitHubApp
//
//  Created by Michelli Cristina de Paulo Lima on 19/01/22.
//

import Foundation

class GithubApp: Codable {
    var name: String
    var description: String
    var stargazersCount: Int
    var watchersCount: Int
    var owner: Owner
}

class Owner: Codable {
    var nameOwner: String
    var login: String
    var avatarProfile: String
    var avatarUrl: String
    //colocar profissao
}

