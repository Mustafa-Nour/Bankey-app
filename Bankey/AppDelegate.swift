//
//  AppDelegate.swift
//  Bankey App
//
//  Created by Mustafa Nour on 17/12/2025.
//

import UIKit

let appColor: UIColor = .systemTeal
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let onboardingContainer = OnboardingContainerViewController()
    let dummyVc = DummyViewController()
    let AccountSummaryVc = AccountSummaryViewController()
    let mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        loginViewController.delegate = self
        onboardingContainer.delegate = self
        registerTheNotification()
        print("didopened")
        displayLogin()
        return true
    }
    
    private func displayLogin() {
        setRootViewController(loginViewController)
    }
    
    private func registerTheNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(didlogOut), name: .logout, object: nil)
    }
    
    private func displayNextScreen() {
        if LocalState.hasOnboraded {
            prepMainView()
            setRootViewController(mainViewController)
        } else {
            setRootViewController(onboardingContainer)
        }
    }
    
    private func prepMainView() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = appColor
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
}

//login delegate
extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        displayNextScreen()
    }
}

//onboarding Delegate
extension AppDelegate: OnboaringContainerControllerDelegate {
    func didFinishOnBoarding() {
        LocalState.hasOnboraded = true
        setRootViewController(loginViewController)
        print("Onboarding has finished ")
    }
}

extension AppDelegate: logoutDelegate {
    @objc func didlogOut() {
        setRootViewController(loginViewController)
        loginViewController.SignInButton.configuration?.showsActivityIndicator = false
    }
}

extension AppDelegate {
    
    // this function for smooth transition
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else  {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}
