//
//  NetworkCatalogTests.swift
//  GeekBrainsShopTests
//
//  Created by Olya Ganeva on 21.05.2022.
//

import XCTest
@testable import GeekBrainsShop

class NetworkCatalogTests: XCTestCase {
    
    let catalogRequestFactory = CommonRequestFactory().makeCatalogRequestFactory()

    func testProductListShouldDownloadAndParse() {
        
        let expectation = XCTestExpectation()
        
        catalogRequestFactory.makeProductListRequest(
            pageNumber: 1,
            categoryID: 1
        ) { response in
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
