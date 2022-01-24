//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

protocol ServiceProtocol {
    
    func fetchRepositories(fromUserName userName: String, completion: @escaping ([Repository]?) -> Void)
}

struct Service: ServiceProtocol {
    
    func fetchRepositories(fromUserName userName: String, completion: @escaping ([Repository]?) -> Void) {
        
        let url = URL(string: "https://api.github.com/users/\(userName)/repos")!
        self.performRequest(url, completion: completion)
    }
    
    func performRequest<T: Decodable>(_ url: URL, completion: @escaping (T?) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            let jsonDecodable = JSONDecoder()
            jsonDecodable.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let decodeObject = try jsonDecodable.decode(T.self, from: data)
                completion(decodeObject)
            } catch {
                print(error)
                completion(nil)
            }
        }.resume()
    }
}


