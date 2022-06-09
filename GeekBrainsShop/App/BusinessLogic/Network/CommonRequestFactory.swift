//
//  CommonRequestFactory.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 28.04.2022.
//

import Alamofire

class CommonRequestFactory {
    
    enum Consts {
        static let remoteURL = "https://gb-shop-server.herokuapp.com/"
        static let localhostURL = "http://127.0.0.1:8080"
    }
    
    let baseURL = URL(
        string: Consts.remoteURL)!

    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    lazy var errorParser: AbstractErrorParser = ErrorParser()
    
    func makeAuthRequestFactory() -> AuthRequestFactory {
        AuthRequestFactory(
            errorParser: errorParser,
            sessionManager: commonSession,
            queue: sessionQueue,
            baseURL: baseURL)
    }
    
    func makeCatalogRequestFactory() -> CatalogRequestFactory {
        CatalogRequestFactory(
            errorParser: errorParser,
            sessionManager: commonSession,
            queue: sessionQueue,
            baseURL: baseURL)
    }
    
    func makeReviewRequestFactory() -> ReviewRequestFactory {
        ReviewRequestFactory(
            errorParser: errorParser,
            sessionManager: commonSession,
            baseURL: baseURL)
    }
    
    func makeCartRequestFactory() -> CartRequestFactory {
        CartRequestFactory(
            errorParser: errorParser,
            sessionManager: commonSession,
            baseURL: baseURL)
    }
}
