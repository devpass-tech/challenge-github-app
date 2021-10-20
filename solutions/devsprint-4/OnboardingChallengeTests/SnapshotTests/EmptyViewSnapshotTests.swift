//
//  EmptyViewSnapshotTests.swift
//  OnboardingChallengeTests
//
//  Created by Murillo R. Araújo on 19/10/21.
//

import XCTest
import SnapshotTesting
@testable import OnboardingChallenge

class EmptyViewSnapshotTests: XCTestCase {
    
    let snapshotSize = CGSize(width: 500, height: 500)
    
    func testEmptyView() {
        let configuration = EmptyViewConfiguration(titleMessage: "No repositories found", emptyMessage: "Search for users to see their public repositories here!")
        let emptyView = EmptyView()
        
        emptyView.updateView(with: configuration)
        
        assertSnapshot(matching: emptyView, as: .image(size: snapshotSize))
    }
}
