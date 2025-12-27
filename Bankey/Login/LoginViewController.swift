//
//  ViewController.swift
//  Bankey App
//
//  Created by Mustafa Nour on 17/12/2025.
//

import UIKit


protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}


class LoginViewController: UIViewController {
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let loginView = LoginView()
    let SignInButton = UIButton(type: .system)
    let errorMesageLabel = UILabel()
    
    // weak reference to avoid retain cycle
    weak var delegate: LoginViewControllerDelegate?
    
    var usernameText: String? {
        return loginView.usernameTextField.text
    }
    
    var passwordText: String? {
        return loginView.usernameTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        //titleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Bankey"
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 50)
        
        titleLabel.adjustsFontForContentSizeCategory = true
        //subTitile
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.textAlignment = .center
        subTitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        subTitleLabel.adjustsFontForContentSizeCategory = true
        subTitleLabel.numberOfLines = 0
        subTitleLabel.text = "Your premium source for all things banking!"
        
        
        //signinButtonm
        SignInButton.translatesAutoresizingMaskIntoConstraints = false
        SignInButton.setTitle("Sign In", for: [])
        SignInButton.configuration = .filled()
        SignInButton.layer.cornerRadius = 8
        SignInButton.configuration?.imagePadding = 8
        SignInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        //errorMessageLabel
        errorMesageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMesageLabel.textAlignment = .center
        errorMesageLabel.textColor = .systemRed
        errorMesageLabel.numberOfLines = 0
        errorMesageLabel.isHidden = false
        
    }
    
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(loginView)
        view.addSubview(SignInButton)
        view.addSubview(errorMesageLabel)
        
        //title
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            

        ])
        
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subTitleLabel.bottomAnchor, multiplier: 3),
            subTitleLabel.widthAnchor.constraint(equalTo: loginView.widthAnchor)
        ])
        
        
        //loginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2)
        ])
        //button
        NSLayoutConstraint.activate(   [
            SignInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            SignInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            SignInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ]
        )
        //errorLabelLayout
        NSLayoutConstraint.activate([
            errorMesageLabel.topAnchor.constraint(equalToSystemSpacingBelow: SignInButton.bottomAnchor, multiplier: 2),
            errorMesageLabel.leadingAnchor.constraint(equalTo: SignInButton.leadingAnchor),
            errorMesageLabel.trailingAnchor.constraint(equalTo: SignInButton.trailingAnchor)
        ])
    }
}

extension LoginViewController {
    
    @objc func signInTapped(sender: UIButton)  {
        errorMesageLabel.isHidden = true
        login()
    }
    
    func login() {
        guard let usernameText = usernameText, let passwordText = passwordText else {
            assertionFailure("UserName/Passeord should never be nil")
            return
        }
        
        if usernameText.isEmpty || passwordText.isEmpty {
            errorMesageLabel.isHidden = false
            errorMesageLabel.text = "UserName/Passeord should never be empty"
            return
        }
        
        if usernameText == "Mo" && passwordText == "Mo" {
            SignInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
           // print("truee")
           // print("truee")
            
        } else {
            errorMesageLabel.text = "username / password is incorrect"
        }
    }
}
