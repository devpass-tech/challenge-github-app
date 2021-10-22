//
//  RepositoryInfoViewTests.swift
//  OnboardingChallengeTests
//
//  Created by Fabio Martinez on 22/10/21.
//

import XCTest
import SnapshotTesting
@testable import OnboardingChallenge

class RepositoryInfoViewTests: XCTestCase {
    
    let snapshotSize = CGSize(width: 500, height: 150)
    
    func testRepositoryInfoView() {
        let configuration = RepositoryInfoViewConfiguration(name: "hereminders-ios", description: "O Hereminders é um app de lembretes geolocalizados, implementado em Swift com arquitetura MVVM-/C", stars: 5, bifurcation: 17)
        
        let repositoryInfoView = RepositoryInfoView()
        
        repositoryInfoView.updateView(with: configuration)
        
        assertSnapshot(matching: repositoryInfoView, as: .image(size:snapshotSize))
    }
}

