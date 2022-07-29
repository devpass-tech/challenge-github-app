//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

struct Service {

    func fetchList(username: String, _ completion: @escaping (Result<[Repository], Error>) -> Void) {
        guard let url = URL(string: "https://api.github.com/users/\(username)/repos") else {
            completion(.failure(APIError.URLError))
        return
        
        }
        let urlSession = URLSession.shared
        let dataTask = urlSession.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                let repositories = try JSONDecoder().decode([Repository].self, from: data)
                completion(.success(repositories))
            }
            catch {
                completion(.failure(APIError.ParseError))
            }
        }
        dataTask.resume()
    }
}
