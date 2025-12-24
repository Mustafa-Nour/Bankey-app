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
    
    let heroImageName : String
    let titleText: String
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        style()
        layout()
    }
    
    init (heroImageName: String, titleText: String ) {
        self.heroImageName = heroImageName
        self.titleText = titleText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension OnBoardingViewController {
    func style() {
        view.backgroundColor = .systemBackground
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        //image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: heroImageName)
        imageView.layer.cornerRadius = 10
        
        //label
        Label.translatesAutoresizingMaskIntoConstraints = false
        Label.numberOfLines = 0
        Label.text = titleText
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
