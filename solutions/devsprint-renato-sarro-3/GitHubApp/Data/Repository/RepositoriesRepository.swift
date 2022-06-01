//
//  RepositoriesRepository.swift
//  GitHubApp
//
//  Created by Renato Sarro on 01/06/22.
//

import Foundation

struct RepositoriesRepository: RepositoriesRepositoryProtocol {
    
    private let service: ServiceProtocol
    
    init(service: ServiceProtocol = Service()) {
        self.service = service
    }
    
    func fetchRepositoryList(user: String, completion: @escaping (Result<[Repository], ApiError>) -> Void) {
        service.fetchData(request: RepositoryRequest(user: user)) { (result: Result<[Repository], ApiError>) in
            completion(result)
        }
    }
}
