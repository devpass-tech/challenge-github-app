// Copyright © 2021 DevPass. All rights reserved.

import Foundation

protocol ServiceProtocol {
  func fetchList(_ completion: ([String]) -> Void)
}

struct Service: ServiceProtocol {
  func fetchList(_ completion: ([String]) -> Void) {
    completion(["Item 1", "Item 2", "Item 3"])
  }
}
