import Foundation
import XCTest

@testable import GitHubApp

final class SampleServiceTests: XCTestCase {
    private let dataSourceSpy = SampleDataStoreStubSpy()
    private lazy var sut = SampleService(dataSource: dataSourceSpy)

    // Triple A (AAA) & Given When Then
    func test_fetchRepositories_givenANotEmptyArray_shouldReturnSuccessWithRightValues() throws {
        // Arrange || Given
        let expectedRepositories: Result<[String], Error> = .success(["GithubApp", "DeliveryApp", "SpaceApp"])
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
            XCTAssertEqual(repositories, try expectedRepositories.get())
        default:
            XCTFail("Result should be Success")
        }
    }

    func test_fetchRepositories_givenAnEmptyArray_shouldReturnFailureWithError() {
        // Arrange || Given
        let expectedRepositories: Result<[String], Error> = .success([])
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

    var fetchListCompletionToBeReturned: Result<[String], Error>?
    private(set) var fetchListCalled = false

    func fetchList(_ completion: @escaping (Result<[String], Error>) -> Void) {
        fetchListCalled = true
        if let fetchListCompletionToBeReturned = fetchListCompletionToBeReturned {
            completion(fetchListCompletionToBeReturned)
        }
    }
}
