//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

struct Service {

    func fetchList(_ completion: ([RepositoryCellModel]) -> Void) {

      let repo1 = RepositoryCellModel(name: "hereminders-ios", owner: "devpass-tech")
      let repo2 = RepositoryCellModel(name: "nexttunes-ios", owner: "devpass-tech")
      let repo3 = RepositoryCellModel(name: "challenge-onboarding", owner: "devpass-tech")
      let repo4 = RepositoryCellModel(name: "challeng-viewcode-realestate", owner: "devpass-tech")
      let repo5 = RepositoryCellModel(name: "challenge-mvvm-delivery", owner: "devpass-tech")
        completion([repo1, repo2, repo3, repo4, repo5])
    }
}
