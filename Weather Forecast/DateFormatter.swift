//
//  File.swift
//  Weather Forecast
//
//  Created by Elham on 20/05/2024.
//


import Foundation

class CustomDateFormatter {
    
    static func isMorning() -> Bool {
        let currentTime = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentTime)
        return hour >= 6 && hour <= 20
    }
    
    static func formateHour(hourString: String?) -> String {
        guard let hourString = hourString else { return "12 AM" }
        
        let dateFormatter = Foundation.DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        guard let date = dateFormatter.date(from: hourString) else {
            return "Invalid Date"
        }
        
        let calendar = Calendar.current
        let currentDate = Date()
        
        if calendar.isDateInToday(date), calendar.component(.hour, from: date) == calendar.component(.hour, from: currentDate) {
            return "Now   "
        } else {
            dateFormatter.dateFormat = "hh a"
            return dateFormatter.string(from: date)
        }
    }
    
    static func getDayByDate(dateString: String?) -> String {
        guard let dateString = dateString else { return "Day" }
        
        let dateFormatter = Foundation.DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let yourDate = dateFormatter.date(from: dateString) else {
            print("Invalid date string")
            return ""
        }
        
        let calendar = Calendar.current
        let dayOfWeek = calendar.component(.weekday, from: yourDate)
        let weekdays = calendar.shortWeekdaySymbols
        var dayOfWeekString = weekdays[dayOfWeek - 1]
        
        if calendar.isDateInToday(yourDate) {
            dayOfWeekString = "Today"
        }
        
        return dayOfWeekString + "  "
    }
    
    static func dateFromString(_ dateString: String?) -> Date? {
        guard let dateString = dateString else { return nil }
        
        let dateFormatter = Foundation.DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return dateFormatter.date(from: dateString)
    }
}
