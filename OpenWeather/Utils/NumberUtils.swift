//
//  NumberUtils.swift
//  OpenWeather
//
//  Created by vitor henrique on 09/09/22.
//

import Foundation

class NumberUtils {
    
    public static func roundNumber (value: Double) -> String  {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter.string(from: value as NSNumber) ?? ""
    }
    
    public static func roundNumberWithComma (value: Double) -> String  {
        let formatter = NumberFormatter()
        formatter.decimalSeparator = ","
        formatter.maximumFractionDigits = 5
        formatter.numberStyle = .decimal
        return formatter.string(from: value as NSNumber) ?? ""
    }
}
