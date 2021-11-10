//
//  Service.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

protocol ServiceProtocol {

    func fetchList(for user: String, _ completion: @escaping ([RepositoriesModel]) -> Void)
}

struct Service: ServiceProtocol {

    func fetchList(for user: String, _ completion: @escaping ([RepositoriesModel]) -> Void) {
        if let url = URL(string: "https://api.github.com/users/" + user + "/repos") {
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in

                if let error = error {
                    print(error)
                    completion([])
                }

                if let data = data {
                    do {
                        let repositories = try JSONDecoder().decode([RepositoriesModel].self, from: data)
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
