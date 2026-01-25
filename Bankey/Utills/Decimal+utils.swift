//
//  Decimal+utils.swift
//  Bankey App
//
//  Created by Mustafa Nour on 23/01/2026.
//

import Foundation
extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
