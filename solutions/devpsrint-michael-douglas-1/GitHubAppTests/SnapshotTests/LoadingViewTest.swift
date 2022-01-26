//
//  LoadingViewTest.swift
//  GitHubAppTests
//
//  Created by Fabio Martinez on 26/01/22.
//

import XCTest
import SnapshotTesting
@testable import GitHubApp

class LoadingViewTest: XCTestCase {

    let snapshotSize = CGSize(width: 500, height: 200)

    func testLoadingView() {
        let configuration = LoadingViewConfiguration(textLabel: "Carregando...")
        
        let loadingView = LoadingView()
        
        loadingView.updateView(with: configuration)
        
        assertSnapshot(matching: loadingView, as: .image)
    }

}
