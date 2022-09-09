//
//  Utils.swift
//  OpenWeather
//
//  Created by vitor henrique on 08/09/22.
//

import Foundation

class DateUtils {
    
    static let formatter = DateFormatter()
    static let date = Date.now

    static func getCurrentDate () -> String {
        let date = Date.now
        formatter.dateStyle = .full
        let formatted = formatter.string(from: date)
        return formatted
    }
    
    public static func currentHourFormatter () -> String {
        
        
        formatter.dateFormat = "dd-MM-yyyy HH:mm Z"
        var dateString = formatter.string(from:date)
        NSLog("%@", dateString)
        dateString.removeLast(5)
        dateString.removeFirst(11)
        return dateString
    }
    
    // Date Formatter Pattern - Swift
    public static func sunriseFormatter (interval:Int?) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(interval ?? 0))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        var strDate = dateFormatter.string(from: date)
        strDate.removeFirst(11)
        return strDate
    }
    
    static func getMonthName (month: String) -> String {
        switch month {
            
        case "1":  return "janeiro"
        case "2":  return "fevereiro"
        case "3":  return "março"
        case "4":  return "abril"
        case "5":  return "maio"
        case "6":  return "junho"
        case "7":  return "julho"
        case "8":  return "agosto"
        case "9":  return "setembro"
        case "10": return "outubro"
        case "11": return "novembro"
        case "12": return "dezembro"
        default:   return ""
        }
    }
}



