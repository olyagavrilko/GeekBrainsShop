//
//  Product.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 21.05.2022.
//

import Foundation

struct ProductListResult: Codable {
    let products: [Product]
}

struct Product: Codable {
    let productID: Int
    let name: String
    let price: Int
}
