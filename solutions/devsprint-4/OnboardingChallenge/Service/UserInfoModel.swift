//
//  UserInfoModel.swift
//  OnboardingChallenge
//
//  Created by Flavia Arsuffi  on 15/10/21.
//

import Foundation

struct UserInfoModel: Codable {
    var id: Int
    var name: String
    var description: String?
    var forks_count: Int
    var stargazers_count: Int
    var owner: Owner
    var license: License
    
}

struct Owner: Codable {
    var login: String
    var avatar_url: String
}

struct License: Codable {
    var key: String
    var name: String
    var spdx_id: String
    var url: String
}
