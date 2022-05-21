//
//  CommonRequestFactory.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 28.04.2022.
//

import Alamofire

class CommonRequestFactory {
    
    let baseURL = URL(
        string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
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
}
