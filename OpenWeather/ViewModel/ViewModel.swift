//
//  ViewModel.swift
//  OpenWeather
//
//  Created by vitor henrique on 06/09/22.
//

import Foundation

class ViewModel: ViewModelProtocol {
    
    var citiesList:[City] = []
    
    let weatherService = OpenWeatherService()
    let apiService = ApiService ()
    
    
    public func fetchWeatherData (latitude: Double, longitude: Double, completion: @escaping (Welcome) -> ()) {
        
        weatherService.fetchWeatherData(latitude: latitude, longitude: latitude) { data in
            
            completion (data)
        }
    }
    
    
    public func getCitesData(completion: @escaping ([City]) -> ()) {
        apiService.fetchCitiesData { cities in
            
            completion(cities)
            self.citiesList = cities
        }
    }
    
    public func getCitiesList () -> [City] {
        return citiesList
    }
}
