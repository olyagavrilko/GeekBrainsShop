//
//  CatalogRequestFactory.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 21.05.2022.
//

import Alamofire

class CatalogRequestFactory: AbstractCatalogRequestFactory {
    
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    let baseURL: URL

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility),
        baseURL: URL
    ) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseURL = baseURL
    }
    
    func makeProductListRequest(
        pageNumber: Int,
        categoryID: Int,
        completionHandler: @escaping (AFDataResponse<[Product]>) -> Void
    ) {
        let requestRouter = ProductListRequestRouter(
            baseURL: baseURL,
            pageNumber: 1,
            categoryID: 1)
        makeRequest(requestRouter: requestRouter, completionHandler: completionHandler)
    }
}

extension CatalogRequestFactory {
    
    struct ProductListRequestRouter: RequestRouter {
        
        let baseURL: URL
        let method: HTTPMethod = .get
        let path = "catalogData.json"
        let pageNumber: Int
        let categoryID: Int
        
        var parameters: Parameters? {
            [
                "page_number": pageNumber,
                "id_category": categoryID
            ]
        }
    }
}
