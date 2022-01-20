//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

protocol ServiceProtocol {
    
    func fetchRepositoryList(_ userName: String, _ completion: @escaping ([Repository]?) -> Void)
}

struct Service: ServiceProtocol {
    
    func fetchRepositoryList(_ userName: String, _ completion: @escaping ([Repository]?) -> Void) {
        
        let url = URL(string: "https://api.github.com/users/\(userName)/repos")!
        self.performRequest(url, completion: completion)
    }
    
    func performRequest<T: Decodable>(_ url: URL, completion: @escaping (T?) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completion(nil)
                return
            }
            
            if let data = data {
                
                let jsonDecodable = JSONDecoder()
                jsonDecodable.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let repositories = try jsonDecodable.decode(T.self, from: data)
                    completion(repositories)
                } catch {
                    print(error)
                    completion(nil)
                }
            }
        }
        dataTask.resume()
    }
}

