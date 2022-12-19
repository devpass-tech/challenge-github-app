//
//  Repository.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 14/01/22.
//

import Foundation

struct Repository: Codable {
    let id: Int?
    let name: String?
    let owner: Owner?
    let description: String?
    let collaboratorsURL: String?
    let contributorsURL: String?
    let gitCommitsURL: String?
    let languagesURL: String?
    let language: String?
    let forksCount, stargazersCount, watchersCount, size: Int?
    let license: License?
}

// MARK: - Owner
struct Owner: Codable {
    let login: String?
    let id: Int?
    let avatarURL: String?
    let url, htmlURL: String?
    let type: String?
}

// MARK: - License
struct License: Codable {
    let key: String?
    let name: String?
    let spdxId: String?
    let url: String?
}
