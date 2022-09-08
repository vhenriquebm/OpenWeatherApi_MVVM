//
//  Utils.swift
//  OpenWeather
//
//  Created by vitor henrique on 08/09/22.
//

import Foundation

class Utils {
    
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
