//
//  URLSession.swift
//  GitHubApp
//
//  Created by Razee Hussein-Jamal on 09/02/2022.
//

import Foundation

// MARK: - URLSession Extension

extension URLSession {
    func dataTask(with url: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) -> URLSessionDataTask {
        dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else {
                if let data = data {
                    completion(.success(data))
                }
            }
        }
    }
}
