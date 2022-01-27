//
//  LoadingViewSnapshotTests.swift
//  GitHubAppUITests
//
//  Created by Felipe Forcinetti on 27/01/22.
//

import SnapshotTesting
import XCTest
@testable import GitHubApp

class LoadingViewSnapshotTests: XCTestCase {
    
    let size = CGSize(width: 350, height: 150)
    
    func testLoadingView() {
        
        let configuration = LoadingViewConfiguration(textLabel: "Searching repositories...")
        let loadingView = LoadingView()
        loadingView.backgroundColor = .white
        loadingView.updateView(with: configuration)
        
        assertSnapshot(matching: loadingView, as: .image(size: size), record: false)
        
    }
}
