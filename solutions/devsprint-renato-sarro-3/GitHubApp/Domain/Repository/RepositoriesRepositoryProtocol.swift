//
//  RepositoriesRepositoryProtocol.swift
//  GitHubApp
//
//  Created by Renato Sarro on 01/06/22.
//

import Foundation

protocol RepositoriesRepositoryProtocol {
    func fetchRepositoryList(user: String, completion: @escaping (Result<[Repository], ApiError>) -> Void)
}
