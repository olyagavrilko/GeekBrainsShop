//
//  AuthAssembly.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 04.07.2022.
//

import UIKit

final class AuthAssembly {
    
    func assemble() -> UIViewController {
        let authRequestFactory = CommonRequestFactory().makeAuthRequestFactory()
        let presenter = AuthPresenter(authRequestFactory: authRequestFactory)
        let viewController = AuthViewController(presenter: presenter)
        presenter.view = viewController
        return viewController
    }
}
