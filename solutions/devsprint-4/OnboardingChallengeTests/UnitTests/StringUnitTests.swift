//
//  StringUnitTests.swift
//  OnboardingChallengeTests
//
//  Created by Murillo R. Araújo on 14/10/21.
//

import XCTest
@testable import OnboardingChallenge

class StringUnitTests: XCTestCase {

    func testRemovingSpaces() throws {
        // Given
        let input: String = "Unit Test"
        let expected: String = "UnitTest"
        
        //When
        let result = input.removingSpaces()
        
        XCTAssertEqual(result, expected)
    }
}
