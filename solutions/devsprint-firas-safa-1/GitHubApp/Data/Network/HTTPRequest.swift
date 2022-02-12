//
//  Endpoint.swift
//  GitHubApp
//
//  Created by Razee Hussein-Jamal on 09/02/2022.
//

import Foundation

// A representation of a `HTTPRequest`
protocol HTTPRequest {
    var host: String { get }
    var path: Path { get }
    var method: HTTPMethod { get }
    var decoder: JSONDecoder { get }
    var encoder: JSONEncoder { get }
}

extension HTTPRequest {
    var decoder: JSONDecoder {
        JSONDecoder()
    }
    
    // There is no use case currently for encoder, therefore encoding hasn't been implemented
    var encoder: JSONEncoder {
        JSONEncoder()
    }
    
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = "/" + path.joined(separator: "/")
        return components.url!
    }
    
    func asURLRequest() -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
}
