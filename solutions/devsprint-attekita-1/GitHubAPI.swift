//
//  GitHubAPI.swift
//  GitHubApp
//
//  Created by Michelli Cristina de Paulo Lima on 18/01/22.
//

import Foundation


class GitHubAPI {
    
    private static let baseURL: String = "https://api.github.com/users/devpass-tech/repos"
    
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = false
        config.httpAdditionalHeaders = ["Content-Type": "aplication/json"]
        config.timeoutIntervalForRequest = 30.0
        config.httpMaximumConnectionsPerHost = 5
        return config
    }()
    
    private static let session = URLSession(configuration: configuration)
    
    class func loadRepos(onComplete: @escaping([GithubApp])->Void) {
        guard let url = URL(string: baseURL) else {return}
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?)
            in
            
            if error == nil {
                guard let response = response as? HTTPURLResponse else {return}
                do {
                    if response.statusCode == 200 {
                        let repos = try JSONDecoder().decode([GithubApp].self, from: data!)
                        onComplete(repos)
                    }
                } catch {
                    print(error)
                }
            }
        }
        dataTask.resume()
    }
}
