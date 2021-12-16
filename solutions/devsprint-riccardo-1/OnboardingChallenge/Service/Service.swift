// Copyright © 2021 Bending Spoons S.p.A. All rights reserved.

import Foundation

protocol ServiceProtocol {
  func fetchList(_ completion: ([RepositoryCellViewConfiguration]) -> Void)
}

struct Service: ServiceProtocol {
  func fetchList(_ completion: ([RepositoryCellViewConfiguration]) -> Void) {
    completion([
        RepositoryCellViewConfiguration(repositoryName: "hereminders-ios", repositoryOwnerName: "rdgborges"),
        RepositoryCellViewConfiguration(repositoryName: "hereminders-ios", repositoryOwnerName: "mateusnazarioc")
      ])
  }
}
