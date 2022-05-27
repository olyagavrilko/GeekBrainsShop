import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    let loginController = LoginController()
    app.get("login", use: loginController.login)
    
    let logoutController = LogoutController()
    app.get("logout", use: logoutController.logout)
}
