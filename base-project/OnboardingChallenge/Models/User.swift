//
//  User.swift
//  OnboardingChallenge
//
//  Created by Fabio Martinez on 19/01/22.
//

import Foundation

struct User: Decodable {
    
    var name: String
    var bio: String
    var followers: Int
    var email: String?
    var location: String
}
