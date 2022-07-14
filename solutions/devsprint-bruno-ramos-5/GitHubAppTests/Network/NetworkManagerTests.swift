import Foundation
import XCTest

@testable import GitHubApp

final class NetworkManagerTests: XCTestCase {
    private let dataTaskStub = DataTaskProtocolStub()
    private lazy var sut = NetworkManager(session: dataTaskStub)

    private typealias DataTaskResult = Result<[DataTaskMocks.ValidResponse], Error>

    func test_request_givenCompletionWithError_shouldReturnCustomError() {
        // Arrange
        dataTaskStub.dataTaskCompletionToBeReturned = (nil, nil, ErrorDummy())
        let url = URL(string: "devpass.com.br")!

        var expectedResult: DataTaskResult?

        // Act
        sut.request(url: url) { expectedResult = $0 }

        // Assert
        XCTAssertEqual(dataTaskStub.dataTaskCalledCount, 1)
        XCTAssertEqual(dataTaskStub.dataTaskUrlPassed, url)
        switch expectedResult {
        case .failure(let error):
            XCTAssertNotNil(error as? NetworkManager.NetworkRequestFailed)
        default:
            XCTFail("expected result should be failure")
        }
    }

    func test_request_givenAValidData_andNilError_shouldReturnSerializedObjectWithSuccess() {
        // Arrange
        dataTaskStub.dataTaskCompletionToBeReturned = (DataTaskMocks.validData, DataTaskMocks.HTTPURLResponse200, nil)
        let url = URL(string: "devpass.com.br")!

        var expectedResult: DataTaskResult?

        // Act
        sut.request(url: url) { expectedResult = $0 }

        // Assert
        XCTAssertEqual(dataTaskStub.dataTaskCalledCount, 1)
        XCTAssertEqual(dataTaskStub.dataTaskUrlPassed, url)
        switch expectedResult {
        case .success(let repositories):
            XCTAssertEqual(repositories.count, 2)
        default:
            XCTFail("expected result should be failure")
        }
    }

    func test_request_givenNilData_andNilError_shouldReturnCustomError() {
        // Arrange
        dataTaskStub.dataTaskCompletionToBeReturned = (nil, DataTaskMocks.HTTPURLResponse200, nil)
        let url = URL(string: "devpass.com.br")!

        var expectedResult: DataTaskResult?

        // Act
        sut.request(url: url) { expectedResult = $0 }

        // Assert
        XCTAssertEqual(dataTaskStub.dataTaskCalledCount, 1)
        XCTAssertEqual(dataTaskStub.dataTaskUrlPassed, url)
        switch expectedResult {
        case .failure(let error):
            XCTAssertNotNil(error as? NetworkManager.NetworkInvalidData)
        default:
            XCTFail("expected result should be failure")
        }
    }

    func test_request_givenValidData_andInvalidResponse_andNilError_shouldReturnDecodeError() {
        // Arrange
        dataTaskStub.dataTaskCompletionToBeReturned = (DataTaskMocks.validData, DataTaskMocks.HTTPURLResponse200, nil)
        let url = URL(string: "devpass.com.br")!

        var expectedResult: Result<[DataTaskMocks.InvalidResponse], Error>?

        // Act
        sut.request(url: url) { expectedResult = $0 }

        // Assert
        XCTAssertEqual(dataTaskStub.dataTaskCalledCount, 1)
        XCTAssertEqual(dataTaskStub.dataTaskUrlPassed, url)
        switch expectedResult {
        case .failure(let error):
            XCTAssertNotNil(error as? DecodingError)
        default:
            XCTFail("expected result should be failure")
        }
    }

    func test_request_givenNilError_andResponseDifferentFrom200_shouldReturnCustomError() {
        // Arrange
        dataTaskStub.dataTaskCompletionToBeReturned = (nil, DataTaskMocks.HTTPURLResponse201, nil)
        let url = URL(string: "devpass.com.br")!

        var expectedResult: Result<[DataTaskMocks.InvalidResponse], Error>?

        // Act
        sut.request(url: url) { expectedResult = $0 }

        // Assert
        XCTAssertEqual(dataTaskStub.dataTaskCalledCount, 1)
        XCTAssertEqual(dataTaskStub.dataTaskUrlPassed, url)
        switch expectedResult {
        case .failure(let error):
            XCTAssertNotNil(error as? NetworkManager.NetworkRequestFailed)
        default:
            XCTFail("expected result should be failure")
        }
    }
}

final class DataTaskProtocolStub: DataTaskProtocol {
    private(set) var dataTaskCalledCount = 0
    private(set) var dataTaskUrlPassed: URL?
    var dataTaskCompletionToBeReturned: (data: Data?, response: URLResponse?, error: Error?)?

    func wrappedDataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        dataTaskCalledCount += 1
        dataTaskUrlPassed = url

        completionHandler(
            dataTaskCompletionToBeReturned?.data,
            dataTaskCompletionToBeReturned?.response,
            dataTaskCompletionToBeReturned?.error
        )
    }
}

enum DataTaskMocks {
    static var validData: Data? {
        """
        [
            {
                "name": "github"
            },
            {
                "name": "deliveryApp"
            }
        ]
        """.data(using: .utf8)
    }

    static var HTTPURLResponse200: HTTPURLResponse? {
        .init(
            url: URL(string: "devpass.com.br")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )
    }

    static var HTTPURLResponse201: HTTPURLResponse? {
        .init(
            url: URL(string: "devpass.com.br")!,
            statusCode: 201,
            httpVersion: nil,
            headerFields: nil
        )
    }

    struct ValidResponse: Codable {
        let name: String
    }

    struct InvalidResponse: Codable {
        let neme: String
    }
}
