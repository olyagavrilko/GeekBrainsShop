//
//  ReviewsResult.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 31.05.2022.
//

import Foundation

struct ReviewsResult: Codable {
    let result: Int
    let reviews: [Review]
}
