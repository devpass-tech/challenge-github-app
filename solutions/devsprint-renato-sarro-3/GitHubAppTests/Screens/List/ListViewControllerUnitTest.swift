//
//  ListViewControllerUnitTest.swift
//  GitHubAppTests
//
//  Created by Renato Sarro on 30/05/22.
//

import Foundation
import XCTest

@testable import GitHubApp

struct ServiceStub: ServiceProtocol {
    func fetchList(_ completion: @escaping ([Repository]) -> Void) {
        completion([
            Repository(name: "Vinicius", description: "Vinicius Description"),
            Repository(name: "Tatiana", description: "Tatiana Description"),
            Repository(name: "Thyago", description: "Thyago Description"),
            Repository(name: "Renato", description: "Renato Description")
        ])
    }
}

final class ListViewSpy: ListViewProtocol {
    var delegate: ListViewControllerProtocol?,
        configuration: ListViewConfiguration?
    
    func updateView(with configuration: ListViewConfiguration) {
        self.configuration = configuration
    }
}

class ListViewControllerUnitTest: XCTestCase {
    
    var sut: ListViewController!
    var spy: ListViewSpy!
    
    override func setUp() {
        spy = ListViewSpy()
        sut = ListViewController(listView: spy, service: ServiceStub())
    }
    
    func test_WhenInitListViewController_ThenCallFetchList_ShouldUpdateListViewCorrectly() {
        sut.viewDidLoad()
        
        XCTAssertFalse(spy.configuration!.listItems.isEmpty)
        XCTAssertNotNil(spy.configuration)
        
        let firstItem = spy.configuration!.listItems[0]
        
        XCTAssertEqual(firstItem.name, "Vinicius")
        XCTAssertEqual(firstItem.description, "Vinicius Description")
    }
}
