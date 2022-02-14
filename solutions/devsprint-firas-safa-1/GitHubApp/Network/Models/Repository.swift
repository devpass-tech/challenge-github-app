//
//  Repository.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 14/01/22.
//

import Foundation

// MARK: - Repository

struct Repository: Decodable {
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case id
    }
}

// MARK: - Owner

struct Owner: Decodable {
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case id
    }
}
