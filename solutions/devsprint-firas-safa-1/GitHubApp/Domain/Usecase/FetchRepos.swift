//
//  FetchRepos.swift
//  GitHubApp
//
//  Created by Razee Hussein-Jamal on 09/02/2022.
//

import Foundation

class FetchRepos {
    var network: NetworkService
    
    init(network: NetworkService) {
        self.network = network
    }
    
    func execute(with value: String, completion: @escaping (GithubResult<Repository>) -> Void) {
       
    }
}
