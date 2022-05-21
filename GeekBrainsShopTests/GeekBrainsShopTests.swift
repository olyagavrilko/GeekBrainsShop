//
//  GeekBrainsShopTests.swift
//  GeekBrainsShopTests
//
//  Created by Olya Ganeva on 27.04.2022.
//

import XCTest
@testable import GeekBrainsShop

class GeekBrainsShopTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let auth = RequestFactory().makeAuthRequestFactory()
        
        let expectation = XCTestExpectation()
        
        auth.login(userName: "", password: "") { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                XCTFail()
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
}
