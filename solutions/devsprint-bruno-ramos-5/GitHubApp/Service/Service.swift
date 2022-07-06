//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

protocol SampleDataSource {
    func fetchList(_ completion: ([String]) -> Void)
}

struct Service: SampleDataSource {
    func fetchList(_ completion: ([String]) -> Void) {
        completion(["Repository 1", "Repository 2", "Repository 3"])
    }
}

final class SampleApiDataSource: SampleDataSource {
    func fetchList(_ completion: ([String]) -> Void) {
        completion([])
    }
}

final class SampleCoreDataDataSource: SampleDataSource {
    func fetchList(_ completion: ([String]) -> Void) {
        completion([])
    }
}
