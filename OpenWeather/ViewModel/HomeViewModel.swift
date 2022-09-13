//
//  ViewModel.swift
//  OpenWeather
//
//  Created by vitor henrique on 06/09/22.
//

import Foundation

class HomeViewModel: HomeViewModelProtocol {
    
    private let apiService: ApiService?
    
    init (apiService: ApiService) {
        self.apiService = apiService
    }
    
    //MARK: - Public methods
    
    public func getCitesData(completion: @escaping ([City]) -> ()) {
        apiService?.fetchCitiesData { cities in
            completion(cities)
        }
    }
}
