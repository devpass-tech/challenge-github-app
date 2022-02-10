//
//  Endpoint.swift
//  GitHubApp
//
//  Created by Razee Hussein-Jamal on 09/02/2022.
//

import Foundation

protocol HTTPRequest {
    var host: String { get set }
    var path: [String] { get set }
    var method: String { get set }
    var body: String { get set }
}

extension HTTPRequest {
    var decoder: JSONDecoder {
        JSONDecoder()
    }
    
    var encoder: JSONEncoder {
        JSONEncoder()
    }
    
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = ""
        
        return components.url!
    }
    
    func asURLRequest(with requestType: HTTPRequest) -> URLRequest {
        var request = URLRequest(url: url)
        let encoded = try? encoder.encode(requestType.body)

        request.httpMethod = method
        request.httpBody = encoded
        return request
    }
}


