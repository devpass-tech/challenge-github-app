//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

protocol ServiceProtocol {
    func fetchRepositories (_ name: String, _ completion: @escaping ([Repository]?) -> Void)
}

struct Service: ServiceProtocol {
    
    func fetchRepositories(_ name: String, _ completion: @escaping ([Repository]?) -> Void) {
        let url = URL(string:"https://api.github.com/users/\(name)/repos")!
        self.request(url, completion: completion)
    }
    
    func request<T: Decodable>(_ url: URL, completion: @escaping (T?) -> Void){
        
        let dataTask = URLSession.shared.dataTask(with: url){ data, response, error
            in
            
            if let _ = error{
                completion(nil)
                return
            }
            
            if let data = data {
                let jsonDecodable = JSONDecoder()
                do{
                    let repo = try jsonDecodable.decode(T.self, from: data)
                    completion(repo)
                }catch{
                    print(error)
                    completion(nil)
                }
       
            }
        }
        
        dataTask.resume()
        
    }
    
}
