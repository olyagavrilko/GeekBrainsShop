//
//  ReviewRequestFactory.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 31.05.2022.
//

import Alamofire

class ReviewRequestFactory: AbstractReviewRequestFactory {
    
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    let baseURL: URL
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility),
        baseURL: URL
    ) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseURL = baseURL
    }
    
    func makeReviewsRequest(
        productID: Int,
        completionHandler: @escaping (AFDataResponse<ReviewsResult>) -> Void
    ) {
        let requestRouter = ReviewsRequestRouter(
            baseURL: baseURL,
            productID: productID
        )
        makeRequest(requestRouter: requestRouter, completionHandler: completionHandler)
    }
    
    func makeAddReviewRequest(
        userID: Int,
        text: String,
        completionHendler: @escaping (AFDataResponse<AddReviewResult>) -> Void
    ) {
        let requestRouter = AddReviewRequestRouter(
            baseURL: baseURL,
            userID: userID,
            text: text
        )
        makeRequest(requestRouter: requestRouter, completionHandler: completionHendler)
    }
    
    func makeRemoveReviewRequest(
        reviewID: Int,
        completionHendler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void
    ) {
        let requestRouter = RemoveReviewRequestRouter(
            baseURL: baseURL,
            reviewID: reviewID
        )
        makeRequest(requestRouter: requestRouter, completionHandler: completionHendler)
    }
}

extension ReviewRequestFactory {
    
    struct ReviewsRequestRouter: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .get
        let path: String = "reviews"
        let productID: Int
        
        var parameters: Parameters? {
            [
                "productID": productID
            ]
        }
    }
    
    struct AddReviewRequestRouter: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .post
        let path: String = "review"
        let userID: Int
        let text: String
        
        var parameters: Parameters? {
            [
                "userID": userID,
                "text": text
            ]
        }
    }
    
    struct RemoveReviewRequestRouter: RequestRouter {
        let baseURL: URL
        let method: HTTPMethod = .delete
        let path: String = "review"
        let reviewID: Int
        
        var parameters: Parameters? {
            [
                "reviewID": reviewID
            ]
        }
    }
}
