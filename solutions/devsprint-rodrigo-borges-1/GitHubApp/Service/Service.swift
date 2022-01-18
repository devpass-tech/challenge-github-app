//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

protocol ServiceProtocol {
    func fetchRepositories (_ completion: @escaping (Repository?) -> Void)
}

struct Service: ServiceProtocol {
    
    func fetchRepositories(_ completion: @escaping (Repository?) -> Void) {
        let url = URL(string:"https://api.github.com/users/devpass-tech/repos")!
        
        let dataTask = URLSession.shared.dataTask(with: url){ data, response, error
            in
            
            if let _ = error{
                completion(nil)
                return
            }
            
            if let data = data {
                let jsonDecodable = JSONDecoder()
                let repo = try? jsonDecodable.decode(Repository.self, from: data)
                completion(repo)
            }
        }
        
        dataTask.resume()
        
    }
    
    func fetchList(_ completion: ([String]) -> Void) {
        completion(["item1", "item2", "item3", "item4"])
    }
    
}
