//
//  URLSession.swift
//  GitHubApp
//
//  Created by Razee Hussein-Jamal on 09/02/2022.
//

import Foundation

enum GithubResult<T: Decodable> {
    case success(GithubResponse<T>)
    case error(GithubResponse<MyError>)
}

struct GithubResponse<T: Decodable> {
    let data: T?
}

enum MyError: Error, Decodable {
    init(from decoder: Decoder) throws {
        self = .runtimeError()
    }
    
    case runtimeError(String = "Something went wrong")
    case networkError(String = "Failed to perform request")
    
    var message: String {
        switch self {
        case .networkError(let message),
             .runtimeError(let message):
            return message
        }
    }
}
