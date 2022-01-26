//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

protocol ServiceProtocol {

    func fetchList(for user: String, _ completion: @escaping ([GithubApp]) -> Void)
}
    
struct Service: ServiceProtocol {

        func fetchList(for name: String, _ completion: @escaping ([GithubApp]) -> Void) {
            if let url = URL(string: "https://api.github.com/users/" + name + "/repos") {
                
                let task = URLSession.shared.dataTask(with: url) { data, response, error in

                    if let error = error {
                        print(error)
                        completion([])
                    }
                    
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase

                    if let data = data {
                        do {
                            let repositories = try jsonDecoder.decode([GithubApp].self, from: data)
                            completion(repositories)

                        } catch {
                            print("Unexpected error: \(error)")
                            completion([])
                        }
                    }
                }
                task.resume()
            }
        }
    }
