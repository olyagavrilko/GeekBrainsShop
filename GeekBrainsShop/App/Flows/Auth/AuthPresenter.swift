//
//  AuthPresenter.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 07.06.2022.
//

import Foundation

final class AuthPresenter {
    
    private let authRequestFactory: AuthRequestFactory
    weak var view: AuthViewController?
    
    init(authRequestFactory: AuthRequestFactory) {
        self.authRequestFactory = authRequestFactory
    }
    
    func loginButtonTapped(username: String?, password: String?) {
        guard let username = username,
              let password = password,
              !username.isEmpty,
              !password.isEmpty
        else {
            return
        }
        
        authRequestFactory.makeLoginRequest(username: username, password: password) { [weak self] response in
            switch response.result {
            case .success:
                DispatchQueue.main.async {
                    self?.view?.openCatalog()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
