//
//  MainViewController .swift
//  Bankey App
//
//  Created by Mustafa Nour on 10/01/2026.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        setupViews()
        setTabBar()
    }
    
    private func setupViews() {
        let summaryVC = AccountSummaryViewController()
        let monyVC = MoveMonyViewController()
        let moreVC = MoreViewController()
        
        summaryVC.setTapBarImage(imageName: "list.dash.header.rectangle", title: "Summary")
        monyVC.setTapBarImage(imageName: "arrow.left.arrow.right", title: "MoveMony")
        moreVC.setTapBarImage(imageName: "ellipsis.circle", title: "More")
        
        let summaryNC = UINavigationController(rootViewController: summaryVC)
        let monyNC = UINavigationController(rootViewController: monyVC)
        let moreNC = UINavigationController(rootViewController: moreVC)
        
        summaryNC.navigationBar.barTintColor = appColor
        hideNavigationBarLine(summaryNC.navigationBar)
        
        let tabBarList = [summaryNC, monyNC, moreNC]
        viewControllers = tabBarList
    }
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = appColor
        appearance.shadowColor = .clear // Hide the shadow line
        
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.compactAppearance = appearance // For smaller layouts
    }
    
    private func setTabBar() {
        tabBar.tintColor = appColor
        tabBar.isTranslucent = false
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = appColor
            appearance.shadowColor = .clear // NO Line
            
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        }
    }
    
    
}

class MoveMonyViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .orange
    }
}

class MoreViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .yellow
    }
}
