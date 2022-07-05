//
//  CartRequestFactory.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 07.06.2022.
//

import Alamofire

class CartRequestFactory: AbstractCartRequestFactory {
    
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
    
    func makeAddToCartRequest(
        productID: Int,
        quantity: Int,
        completionHandler: @escaping (AFDataResponse<AddToCartResult>) -> Void
    ) {
        let requestRouter = AddToCartRouter(
            baseURL: baseURL,
            productID: productID,
            quantity: quantity)
        makeRequest(requestRouter: requestRouter, completionHandler: completionHandler)
    }
    
    func makeDeleteFromCartRequest(
        productID: Int,
        completionHandler: @escaping (AFDataResponse<DeleteFromCartResult>) -> Void
    ) {
        let requestRouter = DeleteFromCartRouter(baseURL: baseURL, productID: productID)
        makeRequest(requestRouter: requestRouter, completionHandler: completionHandler)
    }
    
    func makeBuyRequest(
        completionHandler: @escaping (AFDataResponse<BuyResult>) -> Void
    ) {
        let requestRouter = BuyRouter(baseURL: baseURL)
        makeRequest(requestRouter: requestRouter, completionHandler: completionHandler)
    }
}

extension CartRequestFactory {
    
    struct AddToCartRouter: RequestRouter {
        
        let baseURL: URL
        let method: HTTPMethod = .post
        let path: String = "cart"
        let productID: Int
        let quantity: Int
        
        var parameters: Parameters? {
            [
                "productID": productID,
                "quantity": quantity
            ]
        }
    }
    
    struct DeleteFromCartRouter: RequestRouter {
        
        let baseURL: URL
        let method: HTTPMethod = .delete
        let path: String = "cart"
        let productID: Int
        
        var parameters: Parameters? {
            [
                "productID": productID
            ]
        }
    }
    
    struct BuyRouter: RequestRouter {
        
        var baseURL: URL
        var method: HTTPMethod = .get
        var path: String = "cart"
        
        var parameters: Parameters?
    }
}
