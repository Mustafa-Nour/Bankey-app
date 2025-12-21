//
//  LoginView.swift
//  Bankey App
//
//  Created by Mustafa Nour on 17/12/2025.
//

import UIKit

class LoginView: UIView {
    let stackView = UIStackView()
    let SignInButton = UIButton()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()

    override init(frame: CGRect)  {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init sd Coder has not been impelement ")
    }
    
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: 200 , height: 200)
//    }
//    
}
extension LoginView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
       // usernameTextField.layer.cornerRadius = 5
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.delegate = self
       // passwordTextField.layer.cornerRadius = 2
        
    
        clipsToBounds = true
   
        
    }
    
    func layout() {
        stackView.addArrangedSubview(usernameTextField)
        
        stackView.addArrangedSubview(passwordTextField)
        
        addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1 ),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        
        
    }
}

// MARK: -  ui textField Delegate
extension LoginView :UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if usernameTextField.text != "" {
            return true
        } else {
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
            
    }
}
 
