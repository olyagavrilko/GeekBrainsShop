//
//  AbstractCartRequestFactory.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 07.06.2022.
//

import Alamofire

protocol AbstractCartRequestFactory: AbstractRequestFactory {
    func makeAddToCartRequest(
        productID: Int,
        quantity: Int,
        completionHandler: @escaping (AFDataResponse<AddToCartResult>) -> Void
    )
    
    func makeDeleteFromCartRequest(
        productID: Int,
        completionHandler: @escaping (AFDataResponse<DeleteFromCartResult>) -> Void
    )
    
    func makeBuyRequest(
        completionHandler: @escaping (AFDataResponse<BuyResult>) -> Void
    )
}
