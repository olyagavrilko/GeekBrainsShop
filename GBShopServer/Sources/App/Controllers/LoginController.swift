//
//  LoginController.swift
//  
//
//  Created by Olya Ganeva on 27.05.2022.
//

import Foundation
import Vapor

class LoginController {
    
    func login(_ req: Request) throws -> EventLoopFuture<LoginResponse> {

        guard let body = try? req.query.decode(LoginRequest.self) else {
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let response = LoginResponse(
            result: 1,
            user: User(
                id: 001,
                login: "o_twins",
                name: "Olya",
                lastName: "Gavrilko")
        )
        
        return req.eventLoop.future(response)
    }
}
