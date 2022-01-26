//
//  RepositoryInfoUnitTests.swift
//  GitHubAppTests
//
//  Created by Pedro Francisco Tres on 25/01/22.
//

import XCTest
@testable import GitHubApp

class RepositoryInfoUnitTests: XCTestCase {
    
    func testRepositoryInfo() throws {
        let repository = String.repositoryInfo(repositoriesCount: 1, bifurcationsCount: 2)
        XCTAssertEqual(repository, "1 stars   2 bifurcations")
    }
}
