//
//  UIViewControllerUnitTests.swift
//  GitHubAppTests
//
//  Created by Pedro Francisco Tres on 23/01/22.
//

import XCTest
@testable import GitHubApp

class UIViewControllerUnitTests: XCTestCase {
    
    func testInsideNavigationController() throws {
        
        let viewController = UIViewController()
        
        let navigationController = viewController.insideNavigationController()
        
        XCTAssert(navigationController.viewControllers.first == viewController)
        XCTAssert(navigationController.modalPresentationStyle == .formSheet)
    }
}
