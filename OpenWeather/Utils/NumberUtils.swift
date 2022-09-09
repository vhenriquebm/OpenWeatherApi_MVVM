//
//  NumberUtils.swift
//  OpenWeather
//
//  Created by vitor henrique on 09/09/22.
//

import Foundation

class NumberUtils {
    
    static let formatter = NumberFormatter()
    
    public static func roundNumber (value: Double) -> String  {
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        let formattedAmount = formatter.string(from: value as NSNumber)
        if let result = formattedAmount {
            return result
        }
        return ""
    }
    
    public static func roundNumberWithComma (value: Double?) -> String  {
        formatter.decimalSeparator = ","
        formatter.maximumFractionDigits = 5
        formatter.numberStyle = .decimal
        let formattedAmount = formatter.string(from: value! as NSNumber)
        if let result = formattedAmount {
            return result
        }
        return ""
    }
}
