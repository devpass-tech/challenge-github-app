//
//  LoadingViewTests.swift
//  GitHubAppTests
//
//  Created by Lucas Gomes on 06/04/23.
//

import XCTest
import SnapshotTesting
@testable import GitHubApp

final class LoadingViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSnapshotLoadingView() throws {
        let view = LoadingView()
        view.updateView(with: .init(title: "SnapshotTesting LoadingViewTests"))
        view.startAnimating()
        
        assertSnapshot(matching: view, as: .image(size: .init(width: 300, height: 600)))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
