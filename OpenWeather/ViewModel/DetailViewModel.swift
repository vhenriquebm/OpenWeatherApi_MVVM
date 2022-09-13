//
//  DetailViewModel.swift
//  OpenWeather
//
//  Created by vitor henrique on 13/09/22.
//

import Foundation


class DetailViewModel: DetailViewModelProtocol {
    
    private let weatherService: OpenWeatherService?
    
    init (weatherService: OpenWeatherService) {
        self.weatherService = weatherService
    }

    public func fetchWeatherData (latitude: Double, longitude: Double, completion: @escaping (Welcome) -> ()) {
        weatherService?.fetchWeatherData(latitude: latitude, longitude: longitude) { data in
            completion (data)
        }
    }
    
    
}
