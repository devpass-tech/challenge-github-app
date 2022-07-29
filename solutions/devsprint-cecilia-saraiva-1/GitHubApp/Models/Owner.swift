//
//  Owner.swift
//  GitHubApp
//
//  Created by Amaryllis Baldrez on 27/07/22.
//

import Foundation

struct Owner: Codable {
    let login: String
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
}
