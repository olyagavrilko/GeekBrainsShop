//
//  LoginRequest.swift
//  
//
//  Created by Olya Ganeva on 27.05.2022.
//

import Foundation
import Vapor

struct LoginRequest: Content {
    let username: String
    let password: String
}
