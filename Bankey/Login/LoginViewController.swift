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

protocol logoutDelegate : AnyObject {
   func didlogOut()
}

class LoginViewController: UIViewController {
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    let loginView = LoginView()
    let SignInButton = UIButton(type: .system)
    let errorMesageLabel = UILabel()
    
    // MARK: - animation
    var leadingedgeOnScreen: CGFloat = 16
    var leadingEdgeOffScreen: CGFloat = -1000
    
    var titleLeadingAnchor: NSLayoutConstraint?
    var subTitleLeadingAnchor: NSLayoutConstraint?
    

    
    
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
        view.backgroundColor = .systemBackground
        style()
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide tab bar on login screen
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
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
        titleLabel.alpha = 0
        //subTitile
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.textAlignment = .center
        subTitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        subTitleLabel.adjustsFontForContentSizeCategory = true
        subTitleLabel.numberOfLines = 0
        subTitleLabel.alpha = 0
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
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 3),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        titleLeadingAnchor = titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        titleLeadingAnchor?.isActive = true
        
        
        //subtitle
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            subTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subTitleLabel.widthAnchor.constraint(equalTo: loginView.widthAnchor)
        ])
        subTitleLeadingAnchor = subTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        subTitleLeadingAnchor?.isActive = true
        
        
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
            configureView(with: "UserName/Passeord should never be empty")
            return
        }
        
        if usernameText == "Hi" && passwordText == "Hi" {
            SignInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            SignInButton.configuration?.showsActivityIndicator = false
            configureView(with: "UserName/Passeord should never be empty")

        }
    }
    
    private func configureView(with message: String) {
        errorMesageLabel.isHidden = false
        errorMesageLabel.text = message
        ShakeAnimation()
    }
}


// MARK: -  Animations 
extension LoginViewController {
    private func animate(){
        let duration = 2.0
        let animator1 = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
            self.titleLeadingAnchor?.constant = self.leadingedgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator1.startAnimation()
        
        let animator2 = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
            self.subTitleLeadingAnchor?.constant = self.leadingedgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator2.startAnimation(afterDelay: 1)
        
        let animator3 = UIViewPropertyAnimator(duration: duration*2, curve: .easeInOut) {
            self.titleLabel.alpha = 1
            self.view.layoutIfNeeded()
        }
        animator3.startAnimation(afterDelay: 0.2)
        
        let animator4 = UIViewPropertyAnimator(duration: duration*2, curve: .easeInOut) {
            self.subTitleLabel.alpha = 1
            self.view.layoutIfNeeded()
        }
        animator4.startAnimation(afterDelay: 0.2)
    }
    
    private func ShakeAnimation() {
        let animation = CAKeyframeAnimation()
        
        animation.keyPath = "position.x"
        animation.values = [0, 10 , 10, 0]
        animation.keyTimes = [0, 0.16 , 0.5, 0.83, 1]
        animation.duration = 0.4
        
        animation.isAdditive = true
        SignInButton.layer.add(animation, forKey: "Shake")
    }
}
