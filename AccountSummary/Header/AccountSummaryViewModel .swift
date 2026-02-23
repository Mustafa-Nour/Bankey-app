//
//  AccountSummaryViewModel .swift
//  Bankey App
//
//  Created by Mustafa Nour on 16/02/2026.
//
import Foundation

struct AccountsModel {
    let welcomeMessage: String?
    let name: String?
    let date: Date
    
    var dateFormatted: String {
        return date.monthDayYearString
    }
}
