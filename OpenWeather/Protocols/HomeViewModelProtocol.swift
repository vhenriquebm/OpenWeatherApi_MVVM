//
//  ViewModelProtocol.swift
//  OpenWeather
//
//  Created by vitor henrique on 09/09/22.
//

import Foundation

protocol HomeViewModelProtocol {
    
    func getCitesData(completion: @escaping ([City]) -> ())
}

protocol DetailViewModelProtocol {
    
    func fetchWeatherData (latitude: Double, longitude: Double, completion: @escaping (Welcome) -> ())
}
