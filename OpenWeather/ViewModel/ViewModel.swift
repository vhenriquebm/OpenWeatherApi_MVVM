//
//  ViewModel.swift
//  OpenWeather
//
//  Created by vitor henrique on 06/09/22.
//

import Foundation

class ViewModel {
    
    var citiesList:[City] = []
    
    let weatherService = OpenWeatherService()
    let apiService = ApiService ()
    
    
    public func fetchData (latitude: Double, longitude: Double) {
        
        weatherService.fetchWeatherData(latitude: latitude, longitude: latitude) { data in
            
            print ("Data na Vm")
        }
    }
    
    
    public func getCitesData(completion: @escaping ([City]) -> ()) {
        apiService.fetchCitiesData { cities in
            
            completion(cities)
            self.citiesList = cities
            print (self.citiesList)
        }
    }
    
    public func getCitiesList () -> [City] {
        return citiesList
    }
}
