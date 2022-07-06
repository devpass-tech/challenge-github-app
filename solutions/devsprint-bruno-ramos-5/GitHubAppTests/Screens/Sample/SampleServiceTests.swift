import Foundation
import XCTest

@testable import GitHubApp

final class SampleServiceTests: XCTestCase {
    private let sut = SampleService()

    func testFoo() {
        sut.fetchRepositories(completion: <#T##(Result<[String], Error>) -> Void#>)
    }
}
