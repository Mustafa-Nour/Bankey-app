//
//  AccountSummryCell.swift
//  Bankey App
//
//  Created by Mustafa Nour on 17/01/2026.
//

import Foundation
import UIKit

class AccountSummryCell: UITableViewCell {
    let typeLabel = UILabel()
    let underlinedView = UIView()
    
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 100
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountSummryCell {
    private func setup() {
       //typellabel setup
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        typeLabel.text = "Account Type"
        
        // undelinedView setup
        underlinedView.translatesAutoresizingMaskIntoConstraints = false
        underlinedView.backgroundColor = appColor
        
        contentView.addSubview(typeLabel)
        contentView.addSubview(underlinedView)
    }
    
    
    private func layout() {
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2)
            ])
            // undelinedView layout
            
            NSLayoutConstraint.activate([
                underlinedView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
                underlinedView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
                underlinedView.heightAnchor.constraint(equalToConstant: 5),
                underlinedView.widthAnchor.constraint(equalToConstant: 60)
            ])
    }
}
