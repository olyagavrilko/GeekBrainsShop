//
//  AbstractRequestFactory.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 28.04.2022.
//

import Alamofire

protocol AbstractRequestFactory {
    var errorParser: AbstractErrorParser { get }
    var sessionManager: Session { get }
    var queue: DispatchQueue { get }
    
    @discardableResult
    func makeRequest<T: Decodable>(
        requestRouter: URLRequestConvertible, // Содержит всю необходимую информацию, чтобы послать запрос
        completionHandler: @escaping (AFDataResponse<T>) -> Void
    ) -> DataRequest
}

extension AbstractRequestFactory {
    
    @discardableResult
    public func makeRequest<T: Decodable>(
        requestRouter: URLRequestConvertible,
        completionHandler: @escaping (AFDataResponse<T>) -> Void
    ) -> DataRequest {
        
        return sessionManager
            .request(requestRouter)
            .responseCodable(
                errorParser: errorParser,
                queue: queue,
                completionHandler: completionHandler)
    }
}
