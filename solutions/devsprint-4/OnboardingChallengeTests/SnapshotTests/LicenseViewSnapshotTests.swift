//
//  LicenseViewSnapshotTests.swift
//  OnboardingChallengeTests
//
//  Created by Rodrigo Borges on 21/10/21.
//

import XCTest
import SnapshotTesting
@testable import OnboardingChallenge

class LicenseViewSnapshotTests: XCTestCase {

    let snapshotSize = CGSize(width: 500, height: 180)

    func testLicenseView() {
        let configuration = LicenseViewConfiguration(name: "GNU General Public License v2.0", code: "GLP-2.0")
        let licenseView = LicenseView()

        licenseView.updateView(with: configuration)

        assertSnapshot(matching: licenseView, as: .image(size: snapshotSize))
    }
}
