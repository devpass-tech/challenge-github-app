//
//  RepositoryUseCase.swift
//  GitHubApp
//
//  Created by Renato Sarro on 01/06/22.
//

import Foundation

enum RepositoryError {
    case empty, business
}

protocol RepositoryUseCaseProtocol {
    func execute(user: String, success: @escaping ([Repository]) -> Void, failure: @escaping (RepositoryError) -> Void)
}

struct RepositoryUseCase: RepositoryUseCaseProtocol {
    
    private let repository: RepositoriesRepositoryProtocol
    
    init(repository: RepositoriesRepositoryProtocol = RepositoriesRepository()) {
        self.repository = repository
    }
    
    func execute(user: String, success: @escaping ([Repository]) -> Void, failure: @escaping (RepositoryError) -> Void) {
        repository.fetchRepositoryList(user: user) { result in
            switch result {
            case .success(let response):
                if response.isEmpty {
                    failure(.empty)
                } else {
                    success(response)
                }
            case .failure:
                failure(.business)
            }
        }
    }
}
