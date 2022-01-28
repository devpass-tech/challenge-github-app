//
//  ListViewConfiguration.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 06/10/21.
//

import Foundation

enum ListViewConfiguration {
    case loading
    case empty
    case list(_: [Repository])
}
