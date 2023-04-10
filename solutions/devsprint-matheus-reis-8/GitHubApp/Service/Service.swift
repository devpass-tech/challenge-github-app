//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

struct Service {
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func getRepositories(for user: String, completion: @escaping (Result<[String], Error>) -> Void) {
        let urlString = "https://api.github.com/users/devpass-tech/repos"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let request = URLRequest(url: url)
        
        networkManager.get(request: request) { (result: Result<[RepositoryModel], Error>) in
            switch result {
            case .success(let repositories):
                let repositoryNames = repositories.prefix(10).map { $0.name }
                let repositoryUrls = repositories.prefix(10).map { $0.repositoryUrl }
                print("Repository names: \(repositoryNames)")
                print("Repository URLs: \(repositoryUrls)")
                completion(.success(repositoryNames))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}

