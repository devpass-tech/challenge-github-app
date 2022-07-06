import Foundation
import XCTest

@testable import GitHubApp

final class SampleServiceTests: XCTestCase {
    private let dataSourceSpy = SampleDataStoreStubSpy()
    private lazy var sut = SampleService(dataSource: dataSourceSpy)

    // Triple A (AAA) & Given When Then
    func test_fetchRepositories_givenANotEmptyArray_shouldReturnSuccessWithRightValues() {
        // Arrange || Given
        let expectedRepositories = ["GithubApp", "DeliveryApp", "SpaceApp"]
        dataSourceSpy.fetchListCompletionToBeReturned = expectedRepositories

        // Act || When
        var expectedResult: Result<[String], Error>?

        sut.fetchRepositories { result in
            expectedResult = result
        }

        // Assert || Then
        XCTAssertTrue(dataSourceSpy.fetchListCalled)

        switch expectedResult {
        case .success(let repositories):
            XCTAssertEqual(repositories, expectedRepositories)
        default:
            XCTFail("Result should be Success")
        }
    }

    func test_fetchRepositories_givenAnEmptyArray_shouldReturnFailureWithError() {
        // Arrange || Given
        let expectedRepositories: [String] = []
        dataSourceSpy.fetchListCompletionToBeReturned = expectedRepositories

        // Act || When
        var expectedResult: Result<[String], Error>?

        sut.fetchRepositories { result in
            expectedResult = result
        }

        // Assert || Then
        XCTAssertTrue(dataSourceSpy.fetchListCalled)

        switch expectedResult {
        case .failure(let error):
            XCTAssertNotNil(error as? SampleService.RepositoriesNotFoundError)
        default:
            XCTFail("Result should be Failure")
        }
    }
}

final class SampleDataStoreStubSpy: SampleDataSource {

    var fetchListCompletionToBeReturned: [String] = []
    private(set) var fetchListCalled = false

    func fetchList(_ completion: ([String]) -> Void) {
        fetchListCalled = true
        completion(fetchListCompletionToBeReturned)
    }
}
