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
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case owner
    }
    
    func normalize() -> RepositoryModel {
        return RepositoryModel(
            name: name,
            username: owner.name,
            avatarUrl: owner.avatarUrl
        )
    }
}

// MARK: - Owner

struct Owner: Decodable {
    var name: String
    var avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case name = "login"
        case avatarUrl
    }
}
