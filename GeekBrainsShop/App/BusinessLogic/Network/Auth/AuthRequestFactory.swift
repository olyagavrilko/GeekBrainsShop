//
//  AuthRequestFactory.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 28.04.2022.
//

import Alamofire

protocol AuthRequestFactory {
    func login(
        userName: String,
        password: String,
        completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
    
    func logout(
        userID: Int,
        completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}
