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
    
    lazy var sut: LoadingView = .init()

    let snapshotSize = CGSize(width: 500, height: 200)

    func test_loadingView_whenSnapshot_shouldSucceed() {
        let configuration = LoadingViewConfiguration(textLabel: "Carregando...")
        
        let loadingView = LoadingView()
        
        loadingView.updateView(with: configuration)
        
        assertSnapshot(matching: loadingView, as: .image(size:snapshotSize))
    }

}
