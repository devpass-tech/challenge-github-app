//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

struct Service {

    func fetchList(_ completion: ([String]) -> Void) {

        completion(["Repository 1", "Repository 2", "Repository 3"])
    }
    
    func fetchUserRepositories(userName: String, completionHandler: @escaping (_ repositories: [Repository]?, _ error: Error?) -> ()) {
        guard let url = URL(string: "https://api.github.com/users/\(userName)/repos") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                error == nil,
                let data = data,
                let response = response as? HTTPURLResponse,
                200...299 ~= response.statusCode else {
                completionHandler(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let repositories = try? decoder.decode([Repository].self, from: data) else { return }
            completionHandler(repositories, nil)
        }
        .resume()
    }
}
