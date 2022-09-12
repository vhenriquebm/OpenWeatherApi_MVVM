//
//  Utils.swift
//  OpenWeather
//
//  Created by vitor henrique on 08/09/22.
//
// Date Formatter Pattern - Swift

import Foundation

class DateUtils {
    
    static func getCurrentDate () -> String {
        let formatter = DateFormatter()
        let date = Date.now
        formatter.dateStyle = .full
        let formatted = formatter.string(from: date)
        return formatted
    }

    public static func getCurrentHour (timeInterval: Int) -> String {
        let time = Double(timeInterval)
        let date = Date(timeIntervalSince1970: time)
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.timeZone = TimeZone.current
        let formatted = formatter.string(from: date)
        return formatted
    }
    
    public static func getCurrentHourFooter (timeZone: Int) -> String {
        let date = Date.now
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation:"UTC")
        formatter.timeZone = TimeZone(secondsFromGMT: timeZone)
        formatter.dateFormat = "HH:mm"
        let formatted = formatter.string(from: date)
        return formatted
    }
    
    
   
    
    
    
}



