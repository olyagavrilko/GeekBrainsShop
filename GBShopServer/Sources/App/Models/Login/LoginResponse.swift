//
//  LoginResponse.swift
//  
//
//  Created by Olya Ganeva on 27.05.2022.
//

import Foundation
import Vapor

struct LoginResponse: Content {
    let result: Int
    let user: User
}

struct User: Content {
    let id: Int
    let login: String
    let name: String
    let lastName: String
}
