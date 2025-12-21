//
//  ViewController.swift
//  Bankey App
//
//  Created by Mustafa Nour on 17/12/2025.
//

import UIKit

class LoginViewController: UIViewController {
    let loginView = LoginView()
    let SignInButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }

}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        SignInButton.translatesAutoresizingMaskIntoConstraints = false
        SignInButton.setTitle("Sign In", for: [])
        SignInButton.configuration = .filled()
        SignInButton.layer.cornerRadius = 8
        SignInButton.configuration?.imagePadding = 8
        SignInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(SignInButton)
        //loginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        //button
        NSLayoutConstraint.activate(   [
            SignInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            SignInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            SignInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
        ]
        )
    }
}

extension LoginViewController {
    @objc func signInTapped(sender: UIButton)  {
        
    }
}
