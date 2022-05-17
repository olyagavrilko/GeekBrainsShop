//
//  AbstractErrorParser.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 27.04.2022.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
