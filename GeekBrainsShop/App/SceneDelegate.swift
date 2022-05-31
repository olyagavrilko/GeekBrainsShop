//
//  SceneDelegate.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 27.04.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let requestFactory = CommonRequestFactory()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        let authRequestFactory = requestFactory.makeAuthRequestFactory()

        authRequestFactory.makeLoginRequest(username: "some", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

//        authRequestFactory.makeLogoutRequest(userID: 123) { response in
//            switch response.result {
//            case .success(let response):
//                print(response)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}
