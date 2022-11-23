//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

struct Service {

    func fetchList(_ completion: ([String]) -> Void) {

        completion(["Repository 1", "Repository 2", "Repository 3"])
    }
}

struct ServiceEmpty{
    
    func fetchList(_ completion: ([String]) -> Void) {
        
        completion(["No repositories found", "Search for users to see their public repositories here!"])
    }
}
