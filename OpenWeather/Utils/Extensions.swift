//
//  Extensions.swift
//  OpenWeather
//
//  Created by vitor henrique on 09/09/22.
//

import Foundation

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}

