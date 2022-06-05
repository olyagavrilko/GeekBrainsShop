//
//  User.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 28.04.2022.
//

import Foundation

struct User: Codable {
    let id: Int
    let login: String
    let name: String
    let lastName: String
}
