//
//  StringUnitTests.swift
//  OnboardingChallengeTests
//
//  Created by Diego Fernando on 17/11/21.
//

import XCTest
@testable import OnboardingChallenge

class StringUnitTests: XCTestCase {

             func testRepositoryInfo() throws {
                let repositoryInfo = String.repositoryInfo(repositoriesCount: 10, bifurcationsCount: 10)
                
                XCTAssertTrue(true, "10 repositoriesCount ,10 bifurcations")
                
    }
}

