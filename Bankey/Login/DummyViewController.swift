//
//  DummyViewController.swift
//  Bankey App
//
//  Created by Mustafa Nour on 29/12/2025.
//

import Foundation
import UIKit

class DummyViewController: UIViewController{
    let stackView = UIStackView()
    let Label = UILabel()
    let logOutButton = UIButton(type: .system)
    
    weak var delegate : logoutDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
}

extension DummyViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        Label.translatesAutoresizingMaskIntoConstraints = false
        Label.text = "Welcome"
        Label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        logOutButton.setTitle("LogOut", for: [])
        logOutButton.configuration = .filled()
        logOutButton.addTarget(self, action: #selector(logOutTapped), for: .primaryActionTriggered)
        
        
    }
    
    func layout() {
        stackView.addArrangedSubview(Label)
        stackView.addArrangedSubview(logOutButton)
        
        view.addSubview(stackView)
        //view.addSubview(logOutButton)
        
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo:  view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo:  view.centerYAnchor)
        ])
    }
    
    @objc func logOutTapped(_ sender: UIButton) {
        delegate?.didlogOut()
    }
}
