//
//  HTTPMethod.swift
//  GitHubApp
//
//  Created by Razee Hussein-Jamal on 09/02/2022.
//

import Foundation

struct HTTPMethod: RawRepresentable {
    let rawValue: String
    
    static let GET = HTTPMethod(rawValue: "GET")
    static let POST = HTTPMethod(rawValue: "POST")

    init?(rawValue: String) {
        self.rawValue = rawValue
    }
}
