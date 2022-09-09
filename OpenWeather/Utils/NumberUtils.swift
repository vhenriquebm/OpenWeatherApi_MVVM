//
//  NumberUtils.swift
//  OpenWeather
//
//  Created by vitor henrique on 09/09/22.
//

import Foundation

class NumberUtils {
    public static func roundNumber (value: Double?) -> String  {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        let formattedAmount = formatter.string(from: value! as NSNumber)
        if let result = formattedAmount {
            return result
        }
        return ""
    }
    
}
