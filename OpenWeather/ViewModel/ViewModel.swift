//
//  ViewModel.swift
//  OpenWeather
//
//  Created by vitor henrique on 06/09/22.
//

import Foundation

class ViewModel: ViewModelProtocol {
    
    private let weatherService: OpenWeatherService?
    private let apiService: ApiService?
    
    init (weatherService: OpenWeatherService, apiService: ApiService) {
        self.weatherService = weatherService
        self.apiService = apiService
    }
    
    //MARK: - Public methods
    
    public func getCitesData(completion: @escaping ([City]) -> ()) {
        apiService?.fetchCitiesData { cities in
            completion(cities)
        }
    }
    
    public func fetchWeatherData (latitude: Double, longitude: Double, completion: @escaping (Welcome) -> ()) {
        weatherService?.fetchWeatherData(latitude: latitude, longitude: longitude) { data in
            completion (data)
        }
    }
}
