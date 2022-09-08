//
//  APIError.swift
//  GitHubApp
//
//  Created by Amaryllis Baldrez on 29/07/22.
//

import Foundation

enum APIError: Error {
    case URLError
    case ParseError
    case emptyData
}
