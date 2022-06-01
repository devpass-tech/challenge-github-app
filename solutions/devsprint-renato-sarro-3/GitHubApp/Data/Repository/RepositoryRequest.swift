//
//  RepositoryRequest.swift
//  GitHubApp
//
//  Created by Renato Sarro on 31/05/22.
//

import Foundation

struct RepositoryRequest: RequestProtocol {
    var url: String {
        return "https://api.github.com/users/\(user)/repos"
    }
    
    var parameres: [String : Any] {
        return [:]
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var user: String
}
