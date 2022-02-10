//
//  FetchRepos.swift
//  GitHubApp
//
//  Created by Razee Hussein-Jamal on 09/02/2022.
//

import Foundation

protocol UseCaseProvider {
    func execute<ResponseType: Decodable>() async throws -> [ResponseType]
}

struct RepositoriesUseCase {
    var network: NetworkManager
    let fetchRepos: FetchRepositoriesRequest
    
    func execute<ResponseType: Decodable>() async throws -> [ResponseType] {
        return try await self.network.request(with: fetchRepos)
    }
}

struct FetchRepositoriesRequest: HTTPRequest {
    var host: String = URLHost.GITHUB
    var path: [String] = []
    var method: String = ""
    var body: String = ""
}
