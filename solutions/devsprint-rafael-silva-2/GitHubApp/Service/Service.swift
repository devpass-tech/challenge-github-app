//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation
import UIKit

enum ServiceError: Error{
    case invalidURL
    case decodeFail(Error)
    case network(Error?)
}

class Service {
    
  private let url = "https://api.github.com/users/"
    
    func getService(userAccount: String, callback: @escaping (Result<[Repository], ServiceError >) -> Void) {
        let path = "\(userAccount)/repos"
        guard let request = URL(string: url + path) else {
            callback(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            
            guard let data = data else {
                callback(.failure(.network(error)))
                return
            }
            do {
                let userRepos = try JSONDecoder().decode([Repository].self, from: data)
                callback(.success(userRepos))
            } catch {
                callback(.failure(.decodeFail(error)))
            }
        }
    }
    
    func fetchList(_ completion: ([String]) -> Void) {

            completion(["Repository 1", "Repository 2", "Repository 3"])
        }
    
}
