//
//  GetUserRepos.swift
//  GitHubApp
//
//  Created by Razee Hussein-Jamal on 12/02/2022.
//

import Foundation

struct GetUserRepos: HTTPRequest {
    var host: String = BaseURL.githubAPI
    var path: Path
    var method: HTTPMethod = .get
}
