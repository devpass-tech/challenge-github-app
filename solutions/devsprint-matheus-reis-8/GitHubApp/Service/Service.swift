//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

struct Service {
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func getRepositories(for user: String, completion: @escaping (Result<[String], Error>) -> Void) {
        let urlString = "https://api.github.com/users/\(user)/repos"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let request = URLRequest(url: url)
        
        networkManager.get(request: request) { (result: Result<Data, Error>) in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let repositories = json as? [[String: Any]] {
                        let repositoryNames = repositories.prefix(10).compactMap { $0["name"] as? String }
                        completion(.success(repositoryNames))
                    } else {
                        completion(.failure(NSError(domain: "Invalid response format", code: 0, userInfo: nil)))
                    }
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

