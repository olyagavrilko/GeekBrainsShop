//
//  AuthViewController.swift
//  GeekBrainsShop
//
//  Created by Olya Ganeva on 27.04.2022.
//

import UIKit

final class AuthViewController: UIViewController {
    
    private let presenter: AuthPresenter

    private let namelabel = UILabel()
    private let loginTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton()
    
    init(presenter: AuthPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        setupViews()
    }
    
    private func setupViews() {
        namelabel.text = "GBShop"
        namelabel.textColor = .white
        namelabel.font = UIFont.systemFont(ofSize: 24)
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(namelabel)
        NSLayoutConstraint.activate([
            namelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            namelabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24)
        ])
        
        loginTextField.borderStyle = .roundedRect
        loginTextField.placeholder = "login"
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginTextField)
        NSLayoutConstraint.activate([
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginTextField.topAnchor.constraint(equalTo: namelabel.bottomAnchor, constant: 100)
        ])
        
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "password"
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 16),
        ])
        
        loginButton.setTitle("Войти", for: .normal)
        loginButton.backgroundColor = .cyan
        loginButton.layer.cornerRadius = 10
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 100),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24),
            loginButton.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -50)
        ])
    }
    
    @objc func loginButtonTapped() {
        presenter.loginButtonTapped(username: loginTextField.text, password: passwordTextField.text)
    }
    
    func openCatalog() {
        let catalogViewController = CatalogViewController()
        catalogViewController.modalPresentationStyle = .overFullScreen
        catalogViewController.modalTransitionStyle = .crossDissolve
        present(catalogViewController, animated: true)
    }
}
