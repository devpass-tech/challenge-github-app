//
//  ListViewConfiguration.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 06/10/21.
//

import Foundation

enum ListViewConfiguration {
    case empty
    case loading
    case list(_: [GitHubApp])
}
