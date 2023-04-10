//
//  Repository.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 14/01/22.
//

import Foundation

struct RepositoryModel: Decodable {
    let id: Int
    let name: String
    let repositoryUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case repositoryUrl = "html_url"
    }
}

