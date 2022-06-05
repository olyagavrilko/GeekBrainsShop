//
//  NetworkAuthTests.swift
//  GeekBrainsShopTests
//
//  Created by Olya Ganeva on 27.04.2022.
//

import XCTest
@testable import GeekBrainsShop

class NetworkAuthTests: XCTestCase {
    
    let authRequestFactory = CommonRequestFactory().makeAuthRequestFactory()

    func testLoginShouldDownloadAndParse() {
        
        let expectation = XCTestExpectation()
        
        authRequestFactory.makeLoginRequest(username: "My username", password: "myPassword") { response in
            switch response.result {
            case .success:
                break
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testLogoutShouldDownloadAndParse() {
        
        let expectation = XCTestExpectation()
        
        authRequestFactory.makeLogoutRequest(userID: 123) { response in
            switch response.result {
            case .success:
                break
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
}
