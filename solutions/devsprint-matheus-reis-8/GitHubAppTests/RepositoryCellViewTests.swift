//
//  SnapshotTestRepositoryViewCell.swift
//  GitHubAppTests
//
//  Created by GISELE TOLEDO on 05/04/23.
//

import XCTest
import SnapshotTesting

@testable import GitHubApp


class RepositoryCellViewTests: XCTestCase {

    override func setUpWithError() throws {
           // Put setup code here. This method is called before the invocation of each test method in the class.
       }

       override func tearDownWithError() throws {
           // Put teardown code here. This method is called after the invocation of each test method in the class.
       }

       func testRepositoryCellView() throws {
           let view = RepositoryCellView()
           
           view.updateView(with: .init(repositoryName: "challenge-github-app", userName: "giseletoledo"))

           assertSnapshot(matching: view, as: .image(size: .init(width: 375, height: 70)))
       }

       func testPerformanceExample() throws {
           // This is an example of a performance test case.
           self.measure {
               // Put the code you want to measure the time of here.
           }
       }
}

