//
//  LoadingViewSnapshotTests.swift
//  OnboardingChallengeTests
//
//  Created by Pedro Henrique on 22/10/21.
//

import XCTest
import SnapshotTesting
@testable import OnboardingChallenge

class LoadingViewSnapshotTests: XCTestCase {
    
    let snapshotSize = CGSize(width: 500, height: 500)
    
    func testLoadingView() {
        let configuration = LoadingViewConfiguration(message: "Searching repositories...")
        let loadingView = LoadingView()
        
        loadingView.updateView(with: configuration)
        assertSnapshot(matching: loadingView, as: .image(size: snapshotSize))
    }
}
