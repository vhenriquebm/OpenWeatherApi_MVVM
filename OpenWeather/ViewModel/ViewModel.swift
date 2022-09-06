//
//  ViewModel.swift
//  OpenWeather
//
//  Created by vitor henrique on 06/09/22.
//

import Foundation

class ViewModel {
    
    let service = ApiService()
    
    public func fetchData (latitude: Double, longitude: Double) {
        
        service.fetchWeatherData(latitude: latitude, longitude: latitude) { data in
            
            print ("Data na Vm")
        }
    }
}
