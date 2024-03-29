//
//  Repository.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 14/01/22.
//

import Foundation

struct Repository: Codable {
    let name: String
    let owner: Login
}

struct Login: Codable {
    let login: String
}
