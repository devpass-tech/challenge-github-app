//
//  NetworkEngine.swift
//  GitHubApp
//
//  Created by Razee Hussein-Jamal on 09/02/2022.
//

import Foundation


protocol NetworkRequestProtocol {
    func makeGetRequest<ResponseType: Decodable>(with request: URLRequest, using session: URLSession, completion: @escaping (GithubResult<ResponseType>) -> Void)
}

class NetworkEngine: NetworkRequestProtocol {
    func makeGetRequest<ResponseType: Decodable>(with request: URLRequest, using session: URLSession, completion: @escaping (GithubResult<ResponseType>) -> Void) {
        let task = session.dataTask(with: request) { result in
            self.handleResponse(result, completion: completion)
        }
        task.resume()
    }
    
    private func handleResponse<ResponseType: Decodable>(_ result: Result<Data, Error>, completion: @escaping (GithubResult<ResponseType>) -> Void) {
        switch result {
        case .success(let data):
            do {
                let decoded = try JSONDecoder().decode(ResponseType.self, from: data)
                let respone = GithubResponse(data: decoded)
                completion(GithubResult.success(respone))
            } catch let error {
                let response = GithubResponse(data: MyError.runtimeError(error.localizedDescription))
                completion(GithubResult.error(response))
            }
            
        case .failure(_):
            let response = GithubResponse(data: MyError.networkError())
            completion(GithubResult.error(response))
        }
    }
}
