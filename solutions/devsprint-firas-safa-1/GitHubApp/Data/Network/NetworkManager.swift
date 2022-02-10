//
//  NetworkEngine.swift
//  GitHubApp
//
//  Created by Razee Hussein-Jamal on 09/02/2022.
//

import Foundation

protocol NetworkRequestProtocol {
    func request<ResponseType: Decodable>(with requestType: HTTPRequest) async throws -> [ResponseType]
}

struct NetworkManager: NetworkRequestProtocol {
    private var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<ResponseType: Decodable>(with requestType: HTTPRequest) async throws -> [ResponseType] {
        do {
            let (data, _) = try await session.data(for: requestType.asURLRequest(with: requestType))
            let decoded = try requestType.decoder.decode([ResponseType].self, from: data)
            return decoded
        } catch let error {
            throw error
        }
    }
}
