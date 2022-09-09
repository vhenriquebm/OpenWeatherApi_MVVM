//
//  ViewModelProtocol.swift
//  OpenWeather
//
//  Created by vitor henrique on 09/09/22.
//

import Foundation

protocol ViewModelProtocol {
    
    func getCitesData(completion: @escaping ([City]) -> ())
    
}
