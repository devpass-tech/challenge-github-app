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
