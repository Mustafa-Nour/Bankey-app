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
    
    private  func setupViews() {
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
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    private func setTabBar() {
        tabBar.tintColor = appColor
        tabBar.isTranslucent = false
    }
    
    
}

class AccountSummaryViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .red
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
