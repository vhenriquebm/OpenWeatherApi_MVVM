//
//  ViewModelProtocol.swift
//  OpenWeather
//
//  Created by vitor henrique on 09/09/22.
//

import Foundation

protocol ViewModelProtocol {
    func getCitesData(completion: @escaping ([City]) -> ())
    
    func fetchWeatherData (latitude: Double, longitude: Double, completion: @escaping (Welcome) -> ())
}
