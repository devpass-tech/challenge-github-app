//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

enum RepositoryError {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
    
}

protocol ServiceProtocol {
    func fetchList(_ completion: @escaping ([Repository]) -> Void)
}

struct Service: ServiceProtocol {
    
    private static let basePath = "https://api.github.com/users/viniciusyr/repos"
    
    private static let session = URLSession.shared
    
    func fetchList(_ completion: @escaping ([Repository]) -> Void) {
        guard let url = URL(string: Service.basePath) else {
           
            return
            
        }
        let dataTask = Service.session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else {return}
                    do {
                        let repository = try JSONDecoder().decode([Repository].self, from: data)
                        completion(repository)
                    } catch {
                        
                    }
                    
                } else {
                    
                }
            } else {
                
            }
        }
        dataTask.resume()
        

       // completion([
        //    RepositoryCellViewConfiguration(name: "Renato Sarro", description: "Renato Sarro"),
//            RepositoryCellViewConfiguration(name: "Hack Amanda", description: "Hack Amanda"),
//            RepositoryCellViewConfiguration(name: "Gabriel Barbosa", description: "Gabriel Barbosa"),
//            RepositoryCellViewConfiguration(name: "Tatiana Rico", description: "Tatiana Rico"),
//            RepositoryCellViewConfiguration(name: "Thyago Raphael", description: "Thyago Raphael"),
//            RepositoryCellViewConfiguration(name: "Vinicius Rodrigues", description: "Vinicius Rodrigues"),
//            RepositoryCellViewConfiguration(name: "Mariana Lima", description: "Mariana Lima"),
//            RepositoryCellViewConfiguration(name: "Renato Sarro", description: "Renato Sarro"),
//            RepositoryCellViewConfiguration(name: "Hack Amanda", description: "Hack Amanda"),
//            RepositoryCellViewConfiguration(name: "Gabriel Barbosa", description: "Gabriel Barbosa"),
//            RepositoryCellViewConfiguration(name: "Tatiana Rico", description: "Tatiana Rico"),
//            RepositoryCellViewConfiguration(name: "Thyago Raphael", description: "Thyago Raphael"),
//            RepositoryCellViewConfiguration(name: "Vinicius Rodrigues", description: "Vinicius Rodrigues"),
//            RepositoryCellViewConfiguration(name: "Mariana Lima", description: "Mariana Lima"),
       // ])
    }
}
