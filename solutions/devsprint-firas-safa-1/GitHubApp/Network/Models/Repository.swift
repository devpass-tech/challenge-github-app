//
//  Repository.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 14/01/22.
//

import Foundation

// MARK: - Repository

struct Repository: Decodable {
    var name: String
    var description: String?
    var owner: Owner
}

// MARK: - Owner

struct Owner: Decodable {
    var login: String
    var avatarUrl: String
    var type: String
}
