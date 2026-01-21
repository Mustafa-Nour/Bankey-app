//
//  AccountSummryCell.swift
//  Bankey App
//
//  Created by Mustafa Nour on 17/01/2026.
//

import Foundation
import UIKit

class AccountSummryCell: UITableViewCell {
    
    enum AccountType: String  {
        case Banking
        case CredintCard
        case Investment
    }
    
    struct ViewModel {
        let accountType: AccountType
        let accountName: String
    }
    
    let viewModel: ViewModel? = nil
    
    let typeLabel = UILabel()
    let nameLabel = UILabel()
    let underlinedView = UIView()
    
    let balanceStack = UIStackView()
    let balanceAmmount = UILabel()
    let balanceLabel = UILabel()
    
    let chevronImageView = UIImageView()
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 112
    
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
        
        //name label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.text = "Account name"
        
        //banlance stack
        balanceStack.translatesAutoresizingMaskIntoConstraints = false
        balanceStack.axis = .vertical
        balanceStack.spacing = 0
        
        //balacne labels
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel.textAlignment = .right
        balanceLabel.text = "Some balance"
        
        balanceAmmount.translatesAutoresizingMaskIntoConstraints = false
        balanceAmmount.font = UIFont.preferredFont(forTextStyle: .body)
        balanceAmmount.textAlignment = .right
        balanceAmmount.attributedText = makeFormattedBalance(dollars: "929,466", cents: "63")
        //ceveron
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        chevronImageView.image = UIImage(systemName: "chevron.right")!.withTintColor(appColor, renderingMode: .alwaysOriginal)
        
        contentView.addSubview(typeLabel)
        contentView.addSubview(underlinedView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(chevronImageView)
        balanceStack.addArrangedSubview(balanceLabel)
        balanceStack.addArrangedSubview(balanceAmmount)
        contentView.addSubview(balanceStack)
        
    }
    
    
    private func layout() {
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            
            // underlined view layout
            underlinedView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
            underlinedView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            underlinedView.heightAnchor.constraint(equalToConstant: 5),
            underlinedView.widthAnchor.constraint(equalToConstant: 60),
            
            //namelable layout
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: underlinedView.bottomAnchor, multiplier: 2),
            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            
            //balance stack layouts
            balanceStack.topAnchor.constraint(equalToSystemSpacingBelow: underlinedView.bottomAnchor, multiplier: 0),
            balanceStack.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4),
            trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStack.trailingAnchor, multiplier: 4),
            
            //chevron layout
            chevronImageView.topAnchor.constraint(equalToSystemSpacingBelow: underlinedView.bottomAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 1)
            ])
        
    }
    
    private func makeFormattedBalance(dollars: String, cents: String) -> NSAttributedString {
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .footnote),.baselineOffset: 8]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSAttributedString(string: dollars, attributes: dollarAttributes)
        let centString = NSAttributedString(string: cents, attributes: centAttributes)
        
        rootString.append(dollarString)
        rootString.append(centString)
       
        return rootString
    }
}
extension AccountSummryCell {
    func configure (with vm: ViewModel) {
        typeLabel.text = vm.accountType.rawValue
        nameLabel.text = vm.accountName
        switch vm.accountType {
        case .Banking:
            underlinedView.backgroundColor = appColor
        case .CredintCard:
            underlinedView.backgroundColor = .orange
        case .Investment:
            underlinedView.backgroundColor = .purple
        }
    }
}
