//
//  RepositoryCellViewSnapshotTests.swift
//  GitHubAppTests
//
//  Created by Pedro Francisco Tres on 24/01/22.
//

import XCTest
import SnapshotTesting
@testable import GitHubApp

class RepositoryCellViewSnapshotTests: XCTestCase {

    let size = CGSize(width: 350, height: 80)

    func testRepositoyCellViewSnapshotTests() throws {
        let configuration = RepositoryCellViewConfiguration(repositoryLabel: "challenge-github-app", repositoryOwnerLabel: "devpass-tech")
        
        let repositoryCellView = RepositoryCellView()
        repositoryCellView.backgroundColor = .white
        repositoryCellView.updateView(with: configuration)
        
        assertSnapshot(matching: repositoryCellView, as: .image(size: size))
        
        assertSnapshot(matching: repositoryCellView, as: .recursiveDescription(size: size))
        
    }

  

}
