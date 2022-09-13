//
//  Utils.swift
//  OpenWeather
//
//  Created by vitor henrique on 08/09/22.
//
// Date Formatter Pattern - Swift

import Foundation

class DateUtils {
    
    public static func getCurrentHour (timeInterval: Int, timeZone: Int) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        let dateInTime = timeInterval
        let time = Date(timeIntervalSince1970: TimeInterval(dateInTime))
        formatter.timeZone = TimeZone(secondsFromGMT: timeZone)
        let result = formatter.string(from: time)
        return result
    }
    
    public static func getCurrentHourFooter (timeZone: Int, dt: Int) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        
        let dateInTime = dt
        let time = Date(timeIntervalSince1970: TimeInterval(dateInTime))
        formatter.timeZone = TimeZone(secondsFromGMT: timeZone)
        let result = formatter.string(from: time)
        return result
    }
}


