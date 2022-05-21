//
//  AbstractCatalogRequestFactory.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 21.05.2022.
//

import Alamofire

protocol AbstractCatalogRequestFactory: AbstractRequestFactory {
    func makeProductListRequest(
        pageNumber: Int,
        categoryID: Int,
        completionHandler: @escaping (AFDataResponse<[Product]>) -> Void)
}
