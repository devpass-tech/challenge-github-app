//
//  Repository.swift
//  GitHubApp
//
//  Created by Fabio Martinez on 19/01/22.
//

import Foundation

struct Repository: Decodable {
    
    let name: String
    let id: Int
    let owner: Owner
}

struct Owner: Decodable {
    
    let avatarUrl: String
    let login: String?
    let id: Int
}
