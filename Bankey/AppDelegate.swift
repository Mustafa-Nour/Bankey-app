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
        loginViewController.delegate = self
        onboardingContainer.delegate = self
        let vc = mainViewController
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        vc.setStatusBar()
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = appColor
        appearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance

        window?.rootViewController = vc
        
        return true
    }
}

//login delegate
extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        loginViewController.SignInButton.configuration?.showsActivityIndicator = false
        if LocalState.hasOnboraded {
            setRootViewController(mainViewController)
            
        } else  {
            setRootViewController(onboardingContainer)
        }
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
    func didlogOut() {
        setRootViewController(loginViewController)
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
