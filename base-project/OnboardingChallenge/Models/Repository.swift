//
//  Repository.swift
//  OnboardingChallenge
//
//  Created by Fabio Martinez on 19/01/22.
//

import Foundation

struct Repository: Decodable {
    
    let name: String
    let owner: Owner
}

struct Owner: Decodable {
    
    var avatarUrl: String
}
