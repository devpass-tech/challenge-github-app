//
//  Repository.swift
//  OnboardingChallenge
//
//  Created by Diego Fernando on 09/11/21.
//

import Foundation

struct Repository: Decodable {
    let name: String
    let owner: Owner
}

struct Owner: Decodable {
    
    let login: String
}

