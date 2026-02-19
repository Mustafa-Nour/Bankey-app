//
//  AccountSummaryCellViewModel.swift
//  Bankey App
//
//  Created by Mustafa Nour on 17/02/2026.
//

import Foundation


struct Accounts {
    let accountType: AccountSummryCell.AccountType
    let accountName: String
    let balance: Decimal
    
    var balanceAsAttributedString: NSAttributedString {
           return CurrencyFormatter().makeAttributedCurrency(balance)
       }
}
