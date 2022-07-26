//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

struct Service {

    func fetchList(_ completion: ([RepositoryCellVM]) -> Void) {

      let repo1 = RepositoryCellVM(name: "hereminders-ios", owner: "devpass-tech")
      let repo2 = RepositoryCellVM(name: "nexttunes-ios", owner: "devpass-tech")
      let repo3 = RepositoryCellVM(name: "challenge-onboarding", owner: "devpass-tech")
      let repo4 = RepositoryCellVM(name: "challeng-viewcode-realestate", owner: "devpass-tech")
      let repo5 = RepositoryCellVM(name: "challenge-mvvm-delivery", owner: "devpass-tech")
        completion([repo1, repo2, repo3, repo4, repo5])
    }
}
