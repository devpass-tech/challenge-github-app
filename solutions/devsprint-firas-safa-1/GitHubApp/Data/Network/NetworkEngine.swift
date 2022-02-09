//
//  NetworkEngine.swift
//  GitHubApp
//
//  Created by Razee Hussein-Jamal on 09/02/2022.
//

import Foundation

protocol NetworkRequestProtocol {
    
}

class NetworkEngine: NetworkRequestProtocol {
    func makeGetRequest<ResponseType: Decodable>(with request:completion: @escaping Result<ResponseType, Error>) -> Void {
        
    }
}
