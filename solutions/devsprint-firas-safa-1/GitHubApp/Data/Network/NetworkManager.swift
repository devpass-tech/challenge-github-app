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
    // The instance of `URLSession` to use when making data requests
    private var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // Executes a network request, decodes the response and returns it
    // - Parameter request: `HTTPRequest` instance
    // - Returns: An instance of the same type as decodable `ResponseType`
    func request<ResponseType: Decodable>(with requestType: HTTPRequest) async throws -> [ResponseType] {
        do {
            let (data, _) = try await session.data(for: requestType.asURLRequest())
            let decoded = try requestType.decoder.decode([ResponseType].self, from: data)
            return decoded
        } catch let error {
            throw error
        }
    }
}
