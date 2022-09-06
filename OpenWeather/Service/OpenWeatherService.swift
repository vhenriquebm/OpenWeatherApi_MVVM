//
//  ApiService.swift
//  OpenWeather
//
//  Created by vitor henrique on 06/09/22.
//

import Foundation

class OpenWeatherService {
    
    private let key = "13d457ce5f7c2194e5651c8dd4f9b7d7"
    
    //MARK: - Public methods
    
    public func fetchWeatherData (latitude: Double, longitude: Double, completion: @escaping (Welcome) -> ()) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid="
        
        guard let url = URL(string: urlString + key) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print ("DEBUG: \(error.localizedDescription)")
                return
            }
            
            if let response = response {
               // print (response)
            }
            
            do {
                guard let data = data else {return}

                let decoder = JSONDecoder()
                let weatherData = try decoder.decode(Welcome.self, from: data)
                print (weatherData)
                
            } catch  {
                print ("DEBUG\(error)")
            }
            
        }
        task.resume()
    }
}
