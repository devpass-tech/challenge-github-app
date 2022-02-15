//
//  GetUserRepos.swift
//  GitHubApp
//
//  Created by Razee Hussein-Jamal on 12/02/2022.
//

import Foundation

struct GetUserRepos: HTTPRequest {
    typealias ResponseModel = [Repository]
    var host: URLs = .githubAPI
    var path: Path
    var method: HTTPMethod = .get
}
