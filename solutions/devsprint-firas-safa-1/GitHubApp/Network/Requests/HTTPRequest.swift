//
//  Endpoint.swift
//  GitHubApp
//
//  Created by Razee Hussein-Jamal on 09/02/2022.
//

import Foundation

// A representation of a `HTTPRequest`
protocol HTTPRequest {
    associatedtype ResponseModel: Decodable
    var host: URLs { get }
    var path: Path { get }
    var method: HTTPMethod { get }
    var decoder: JSONDecoder { get }
}

extension HTTPRequest {
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host.rawValue
        components.path = "/" + path.joined(separator: "/")
        return components.url!
    }
    
    func asURLRequest() -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
}
