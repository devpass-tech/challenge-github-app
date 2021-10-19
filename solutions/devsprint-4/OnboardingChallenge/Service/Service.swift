//
//  Service.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

protocol ServiceProtocol {

    func fetchList(userName: String, completion: @escaping ([UserInfoModel]) -> Void)
}

struct Service: ServiceProtocol {
    
    var userName: String
    
    func fetchList(userName: String, completion: @escaping ([UserInfoModel]) -> Void) {
        let url = URL(string: "https://api.github.com/users/" + userName + "/repos")!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error)
                completion([])
            }
            
            if let data = data {
                
                do {
                    let userInfo = try JSONDecoder().decode([UserInfoModel].self, from: data)
                    completion(userInfo)
                    
                } catch {
                    print("Unexpected error: \(error)")
                    completion([])
                }
            }
        }
        
        task.resume()
    }
}
