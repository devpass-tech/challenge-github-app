//
//  EmptyViewSnapshotTests.swift
//  GitHubAppTests
//
//  Created by Pedro Francisco Tres on 27/01/22.
//

import XCTest
import SnapshotTesting
@testable import GitHubApp
class EmptyViewSnapshotTests: XCTestCase {
    
    let size = CGSize(width: 350, height: 600)

    func testEmptyView() throws {
        let configuration = EmptyViewConfiguration(title: "No repositories found", subtitle: "Search for users to see their public repositories here!")
        
        let emptyView = EmptyView()
        emptyView.backgroundColor = .white
        emptyView.updateView(with: configuration)
        
        assertSnapshot(matching: emptyView, as: .image(size: size))
    
    }



}
