//
//  Service.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

protocol ServiceProtocol {

    func fetchList(_ completion: ([String]) -> Void)
}

struct Service: ServiceProtocol {

    func fetchList(_ completion: ([String]) -> Void) {

        completion(["Item 1", "Item 2", "Item 3"])
    }
}
