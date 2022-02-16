//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

struct Service {
    private let network: NetworkManager
    
    init() {
        self.network = NetworkManager()
    }
    
    func fetchList(username: String) async throws -> [RepositoryModel] {
        let getUserRepos = GetUserRepos(path: ["users", username, "repos"])
        
        do {
            let normalized = try await network.request(with: getUserRepos).map({ repo in
                repo.normalize()
            })
            return normalized
        } catch {
            throw error
        }
    }
}
