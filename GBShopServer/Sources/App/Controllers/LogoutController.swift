//
//  LogoutController.swift
//  
//
//  Created by Olya Ganeva on 27.05.2022.
//

import Foundation
import Vapor

class LogoutController {
    
    func logout(_ req: Request) throws -> EventLoopFuture<LogoutResponse> {
        
        guard let body = try? req.query.decode(LogoutRequest.self) else {
            throw Abort(.badRequest)
        }
        
        print(body)
        
        let response = LogoutResponse(result: 1)
        
        return req.eventLoop.future(response)
    }
}
