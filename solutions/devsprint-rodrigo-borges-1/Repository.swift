//
//  Repository.swift
//  GitHubApp
//
//  Created by Pedro Francisco Tres on 17/01/22.
//

import Foundation

struct Repository: Codable {
    let id: Int
    let name, fullName: String
    let owner: Owner
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner
     
    }
}

struct Owner: Codable {
    let login: String?
    let id: Int

    
    enum CodingKeys: String, CodingKey {
        case login, id

    }
}






