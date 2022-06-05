//
//  AbstractAuthRequestFactory.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 28.04.2022.
//

import Alamofire

protocol AbstractAuthRequestFactory: AbstractRequestFactory {
    func makeLoginRequest(
        username: String,
        password: String,
        completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
    func makeLogoutRequest(
        userID: Int,
        completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}
