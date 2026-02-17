//
//  DateUTIL.swift
//  Bankey App
//
//  Created by Mustafa Nour on 16/02/2026.
//

import Foundation

extension Date {
    static var bankeyDateFormatter: DateFormatter {
        let formatter =  DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "MDT")
        return formatter
    }

    
    var monthDayYearString: String {
        let dateFormatter = Date.bankeyDateFormatter
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: self)
    }
}
