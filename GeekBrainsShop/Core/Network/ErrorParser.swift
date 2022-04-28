//
//  ErrorParser.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 27.04.2022.
//

import Foundation

class ErrorParser: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return result
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
