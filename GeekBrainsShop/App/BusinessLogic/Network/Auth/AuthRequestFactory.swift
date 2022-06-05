//
//  AuthRequestFactory.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 28.04.2022.
//

import Alamofire

class AuthRequestFactory: AbstractAuthRequestFactory {
    
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
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
    
    func makeLoginRequest(
        username: String,
        password: String,
        completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void
    ) {
        let requestRouter = LoginRequestRouter(baseURL: baseURL, login: username, password: password)
        makeRequest(requestRouter: requestRouter, completionHandler: completionHandler)
    }
    
    func makeLogoutRequest(
        userID: Int,
        completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void
    ) {
        let requestRouter = LogoutRequestRouter(baseURL: baseURL, userID: userID)
        makeRequest(requestRouter: requestRouter, completionHandler: completionHandler)
    }
}

extension AuthRequestFactory {
    
    struct LoginRequestRouter: RequestRouter {
        
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "login"
        let login: String
        let password: String
        
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password
            ]
        }
    }
    
    struct LogoutRequestRouter: RequestRouter {
        
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "logout"
        let userID: Int
        
        var parameters: Parameters? {
            return [
                "userID": userID
            ]
        }
    }
}
