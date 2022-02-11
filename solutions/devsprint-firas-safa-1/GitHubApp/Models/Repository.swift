//
//  Repository.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 14/01/22.
//

import Foundation

// MARK: - Repository

class Repository: Decodable {
    let id: Int

    enum CodingKeys: String, CodingKey {
        case id
    }

    init(id: Int) {
        self.id = id
    }
}
