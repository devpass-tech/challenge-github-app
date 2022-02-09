//
//  FetchRepos.swift
//  GitHubApp
//
//  Created by Razee Hussein-Jamal on 09/02/2022.
//

import Foundation

class FetchRepos {
    var network: NetworkEngine
    
    init(network: NetworkEngine) {
        self.network = network
    }
    
    func execute(with request: RepositoriesRequest, completion: @escaping (GithubResult<Repository>) -> Void) {
        self.network.makeGetRequest(with: Endpoint.repositories(username: request.username).request, completion: completion)
    }
}
