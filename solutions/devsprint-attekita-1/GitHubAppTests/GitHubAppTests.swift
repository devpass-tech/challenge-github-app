//
//  GitHubAppTests.swift
//  GitHubAppTests
//
//  Created by Rodrigo Borges on 07/01/22.
//

import XCTest
import SnapshotTesting
@testable import GitHubApp

class GitHubAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLicenseView() throws {
        let licenseView = LicenseView(frame: .init(x: 0, y: 0, width: 400, height: 200))
        
        licenseView.updateView(with: LicenseViewConfiguration(licenseTitle: "License", licenseName: "GNU General Public License v2.0", licenseCode: "GPL-2.0"))
        assertSnapshot(matching: licenseView, as: .image, record: false, testName: "LicenseView")
    }
}
