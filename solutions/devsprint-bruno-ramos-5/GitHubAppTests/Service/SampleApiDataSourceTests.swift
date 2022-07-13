import Foundation
import XCTest
@testable import GitHubApp

final class SampleApiDataSourceTests: XCTestCase {
    private let networkStub = NetworkProtocolStub()
    private lazy var sut = SampleApiDataSource(network: networkStub)

    func test_fetchList_givenRequestCompletionSuccessWithValues_shouldReturnSuccessWithMappedNameValues() {
        // Arrange
        let expectedResult: Result<[RepositoryResponse], Error> = Result.success([
            .init(name: "github", category: "foo"),
            .init(name: "delivery", category: "foo")
        ])

        networkStub.requestCompletionToBeReturned = expectedResult

        // Act
        var expectedRepositories: Result<[String], Error>?
        sut.fetchList { repositories in
            expectedRepositories = repositories
        }

        // Assert
        XCTAssertEqual(networkStub.requestCalledCount, 1)
        XCTAssertEqual(networkStub.requestUrlPassed?.absoluteString, "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/home_restaurant_list.json")

        switch expectedRepositories {
        case .success(let repositoriesNames):
            XCTAssertEqual(repositoriesNames, ["github", "delivery"])
        default:
            XCTFail("expectedRepositories result should be success")
        }
    }

    func test_fetchList_givenRequestCompletionSuccessWithEmptyValue_shouldReturnFailureWithCustomError() {
        // Arrange
        let expectedResult: Result<[RepositoryResponse], Error> = Result.success([])

        networkStub.requestCompletionToBeReturned = expectedResult

        // Act
        var expectedRepositories: Result<[String], Error>?
        sut.fetchList { repositories in
            expectedRepositories = repositories
        }

        // Assert
        XCTAssertEqual(networkStub.requestCalledCount, 1)
        XCTAssertEqual(networkStub.requestUrlPassed?.absoluteString, "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/home_restaurant_list.json")

        switch expectedRepositories {
        case .failure(let error):
            XCTAssertNotNil(error as? SampleApiDataSource.FetchListEmptyError)
        default:
            XCTFail("expectedRepositories result should be failure")
        }
    }

    func test_fetchList_givenRequestCompletionFailureWithError_shouldReturnFailureWithError() {
        // Arrange
        let expectedResult: Result<[RepositoryResponse], Error> = Result.failure(ErrorDummy())

        networkStub.requestCompletionToBeReturned = expectedResult

        // Act
        var expectedRepositories: Result<[String], Error>?
        sut.fetchList { repositories in
            expectedRepositories = repositories
        }

        // Assert
        XCTAssertEqual(networkStub.requestCalledCount, 1)
        XCTAssertEqual(networkStub.requestUrlPassed?.absoluteString, "https://raw.githubusercontent.com/devpass-tech/challenge-delivery-app/main/api/home_restaurant_list.json")

        switch expectedRepositories {
        case .failure(let error):
            XCTAssertNotNil(error as? SampleApiDataSource.FetchListError)
        default:
            XCTFail("expectedRepositories result should be failure")
        }
    }
}

struct ErrorDummy: Error {}

final class NetworkProtocolStub: NetworkProtocol {
    private(set) var requestCalledCount = 0
    private(set) var requestUrlPassed: URL?
    var requestCompletionToBeReturned: Any?

    func request<T: Codable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        requestCalledCount += 1
        requestUrlPassed = url

        if let requestCompletionToBeReturned = requestCompletionToBeReturned,
            let expectedRequest = requestCompletionToBeReturned as? Result<T, Error> {
            completion(expectedRequest)
        }
    }
}
