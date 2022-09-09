//
//  ApiService.swift
//  OpenWeather
//
//  Created by vitor henrique on 06/09/22.
//

import Foundation

class ApiService {
    
    //MARK: - Public methods
    
    public func fetchCitiesData (completion: @escaping ([City]) -> ()) {
        
        let urlString = "https://s3.amazonaws.com/br.com.xds.challenge/cidades.json"
        
        guard let url = URL(string: urlString ) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print ("DEBUG: \(error.localizedDescription)")
                return
            }
            
            do {
                guard let data = data else {return}

                let decoder = JSONDecoder()
                let cities = try decoder.decode([City].self, from: data)
                
                completion(cities)
            
            } catch  {
                print ("DEBUG\(error)")
            }
            
        }
        task.resume()
    }
}
