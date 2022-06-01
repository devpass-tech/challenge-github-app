//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

enum ApiError: String, Error {
    case url
    case taskError
    case noResponse
    case noData
    case responseStatusCode
    case invalidJSON
    
}

protocol URLSessionProtocol {
    func fetchData(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: URLSessionProtocol {
    func fetchData(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let dataTask = dataTask(with: request, completionHandler: completionHandler)
        dataTask.resume()
    }
}

protocol ServiceProtocol {
    func fetchData<T: Decodable>(request: RequestProtocol, _ completion: @escaping (Result<T, ApiError>) -> Void)
}

struct Service: ServiceProtocol {
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func fetchData<T: Decodable>(request: RequestProtocol, _ completion: @escaping (Result<T, ApiError>) -> Void) {
        guard let url = URL(string: request.url) else {
            completion(.failure(.url))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        session.fetchData(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            
            guard error == nil else {
                completion(.failure(.taskError))
                return
            }
            
            if let response = response as? HTTPURLResponse, (200...210).contains(response.statusCode) {
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }

                
                do {
                    let repository = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(repository))
                } catch {
                    completion(.failure(.invalidJSON))
                }
            } else {
                completion(.failure(.noResponse))
            }
        }
    }
}
