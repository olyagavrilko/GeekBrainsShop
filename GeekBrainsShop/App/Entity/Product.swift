//
//  Product.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 21.05.2022.
//

import Foundation

struct Product: Codable {
    let id: Int
    let name: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price
    }
}
