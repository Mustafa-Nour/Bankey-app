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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        loginViewController.delegate = self
        onboardingContainer.delegate = self
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        //window?.rootViewController = loginViewController
        
        
        window?.rootViewController = onboardingContainer
        
        
        
        return true
    }

}
//login delegate or
extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        print("Did Login")
    }
}

extension AppDelegate: OnboaringContainerControllerDelegate {
    func didFinishOnBoarding() {
        print("Onboarding has finished ")
    }
}
