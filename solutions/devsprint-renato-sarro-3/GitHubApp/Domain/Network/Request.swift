//
//  Request.swift
//  GitHubApp
//
//  Created by Renato Sarro on 31/05/22.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

protocol RequestProtocol {
    var url: String { get }
    var parameres: [String: Any] { get }
    var method: HTTPMethod { get }
}
