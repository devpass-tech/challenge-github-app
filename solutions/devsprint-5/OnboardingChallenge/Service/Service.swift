//
//  Service.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

protocol ServiceProtocol {

    func fetchList(username: String, _ completion: @escaping  ([Repository]?) -> Void)
}

struct Service: ServiceProtocol {
    func fetchList(username: String, _ completion: @escaping ([Repository]?) -> Void) {
        let path: String = "https://api.github.com/users/\(username)/repos"
        let url = URL(string: path)!
        
       let datatask = URLSession.shared.dataTask(with: url )   {
        data, response, error in
        
        if error != nil {
            completion(nil)
            return
        }
        
        if let data  = data {
            let jsonDecoder = JSONDecoder()
            let repository = try? jsonDecoder.decode([Repository].self, from: data)
            completion(repository)
            
        }

     }
        datatask.resume()
    }
}
