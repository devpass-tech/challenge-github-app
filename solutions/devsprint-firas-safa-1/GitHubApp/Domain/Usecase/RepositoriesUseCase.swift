//
//  FetchRepos.swift
//  GitHubApp
//
//  Created by Razee Hussein-Jamal on 09/02/2022.
//

import Foundation
import UIKit

protocol UseCaseProvider {
    func execute<ResponseType: Decodable>(with body: String) async throws -> [ResponseType]
}

struct RepositoriesUseCase {
    var network: NetworkManager
    var repos: PostRepositoriesRequest
    
    mutating func execute<ResponseType: Decodable>(with body: String) async throws -> [ResponseType] {
        self.repos.path = HTTPPath.USER + "/\(body)" + HTTPPath.REPOS
        let response = try await self.network.request(with: repos) as [ResponseType]
        return response
    }
}

struct PostRepositoriesRequest: HTTPRequest {
    var host: String = URLHost.GITHUB
    var path: String = ""
    var method: String = HTTPMethod.POST
    var body: String = ""
}
