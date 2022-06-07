//
//  AbstractReviewRequestFactory.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 31.05.2022.
//

import Alamofire

protocol AbstractReviewRequestFactory: AbstractRequestFactory {
    func makeReviewsRequest(
        productID: Int,
        completionHandler: @escaping (AFDataResponse<ReviewsResult>) -> Void
    )
    
    func makeAddReviewRequest(
        userID: Int,
        text: String,
        completionHendler: @escaping (AFDataResponse<AddReviewResult>) -> Void
    )
    
    func makeRemoveReviewRequest(
        reviewID: Int,
        completionHendler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void
    )
}
