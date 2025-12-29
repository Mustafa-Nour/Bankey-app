//
//  AppDelegate.swift
//  Bankey App
//
//  Created by Mustafa Nour on 17/12/2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    
    let onboardingContainer = OnboardingContainerViewController()
    
    let dummyVc = DummyViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        loginViewController.delegate = self
        onboardingContainer.delegate = self
        dummyVc.delegate = self
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = dummyVc

        //window?.rootViewController = onboardingContainer

        return true
    }

}
//login delegate
extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        print("Did Login")
        setRootViewController(onboardingContainer)
    }
}

//onboarding Delegate
extension AppDelegate: OnboaringContainerControllerDelegate {
    func didFinishOnBoarding() {
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
