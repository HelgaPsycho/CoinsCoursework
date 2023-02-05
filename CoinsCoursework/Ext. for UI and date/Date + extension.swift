//
//  Date + extension.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 06.02.2023.
//

import Foundation
extension Date {
    var dayText: String {
        if Locale.current.calendar.isDateInToday(self) {
            let timeText = formatted(date: .omitted, time: .shortened)
            let timeFormat = NSLocalizedString("Today at %@", comment: "Today and time format string")
            return String(format: timeFormat, timeText)
        } else {
            return formatted(.dateTime.year().month().day().weekday())
        }
    }
}

