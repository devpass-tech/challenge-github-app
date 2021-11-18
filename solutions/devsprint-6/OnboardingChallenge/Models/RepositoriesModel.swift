//
//  RepositoriesModel.swift
//  OnboardingChallenge
//
//  Created by Marcos Jr on 10/11/21.


import Foundation

// MARK: - RepositoryModel
struct RepositoriesModel: Codable {
    let id: Int
    let name: String
    let owner: Owner
    let stargazersCount: Int
    let language: String?
    let forksCount: Int
}

// MARK: - Owner
struct Owner: Codable {
    let login: String
}
