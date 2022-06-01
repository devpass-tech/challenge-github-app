//
//  ListViewControllerSnapshotTest.swift
//  GitHubAppTests
//
//  Created by Renato Sarro on 26/05/22.
//

import Foundation
import SnapshotTesting
import XCTest

@testable import GitHubApp

class ListViewControllerSnapshotTest: XCTestCase {
    
    var sut: ListViewController!
    
    override func setUp() {
        sut = ListViewController()
    }
    
    func test_WhenPresentListViewController_ShouldHaveValidSnapshot() {
        assertSnapshot(matching: UINavigationController(rootViewController: sut), as: .image(on: .iPhoneX))
    }
}
