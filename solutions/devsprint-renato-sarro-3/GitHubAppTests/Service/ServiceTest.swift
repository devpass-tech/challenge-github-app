//
//  ServiceTest.swift
//  GitHubAppTests
//
//  Created by Renato Sarro on 31/05/22.
//

import Foundation
import XCTest

@testable import GitHubApp

final class URLSessionStub: URLSessionProtocol {
    func fetchData(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        completionHandler(nil, nil, ApiError.taskError)
    }
}

struct RequestFake: RequestProtocol {
    var url: String {
        return "http://www.devsprint.dev.pass"
    }
    
    var parameres: [String : Any] {
        [:]
    }
    
    var method: HTTPMethod {
        return .get
    }
}

struct DecodableDummy: Decodable {}

class ServiceTest: XCTestCase {
    
    var sut: Service!
    
    override func setUp() {
        sut = Service(session: URLSessionStub())
    }
    
    func test_WhenMakeRequest_ThenRequestFails_ShouldCallFailureBlock() {
        var resultTest: Result<DecodableDummy, ApiError>!
        
        sut.fetchData(request: RequestFake()) { (result: Result<DecodableDummy, ApiError>) in
            resultTest = result
        }
        
        switch resultTest {
        case .failure(let error):
            XCTAssertEqual(error, ApiError.taskError)
        default:
            XCTFail("Expected a failure, but receive a success request")
        }
    }
    
    func test_WhenMakeRequest_ThenDecodeFails_ShouldCallFailureBlock() {
        
    }
    
    func test_WhenMakeRequest_ThenRequestSuccess_ShouldCallSuccessBlock() {
        
    }
}
