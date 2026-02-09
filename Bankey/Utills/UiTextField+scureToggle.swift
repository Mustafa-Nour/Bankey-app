//
//  UiTextField+scureToggle.swift
//  Bankey App
//
//  Created by Mustafa Nour on 09/02/2026.
//

import UIKit
import Foundation

let passwordTogglButton = UIButton(type: .custom)


extension UITextField {
    func enablePasswordToggle () {
        passwordTogglButton.setImage(UIImage(systemName: "eye.fill"),for: .normal)
        passwordTogglButton.setImage(UIImage(systemName: "eye.slash.fill"),for: .selected)
        passwordTogglButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = passwordTogglButton
        rightViewMode = .always
    }
    @objc func togglePasswordView() {
        isSecureTextEntry.toggle()
        passwordTogglButton.isSelected.toggle()
    }
}
