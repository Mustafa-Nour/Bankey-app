//
//  OnBoardingViewController.swift
//  Bankey App
//
//  Created by Mustafa Nour on 24/12/2025.
//

import Foundation
import UIKit

class OnBoardingViewController: UIViewController{
    let stackView = UIStackView()
    let imageView = UIImageView()
    let Label = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        style()
        layout()
    }
    
}

extension OnBoardingViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        //image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "delorean")
        imageView.layer.cornerRadius = 10
        
        //label
        
        Label.translatesAutoresizingMaskIntoConstraints = false
        Label.numberOfLines = 0
        Label.text = "bankey is faster, easier to use, adnd has a brand look and feel "
        Label.textAlignment = .center
        Label.font = UIFont.preferredFont(forTextStyle: .title3)
        Label.adjustsFontForContentSizeCategory = true
        
    }
    
    func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(Label)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo:  view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo:  view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1 )
        ])
     
        
        
    }
}
