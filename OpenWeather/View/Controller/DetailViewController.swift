//
//  DetailViewController.swift
//  OpenWeather
//
//  Created by vitor henrique on 06/09/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Properties
    
     var city:City?
    private var weatherInformaton: Welcome?
    
    //MARK: - Outlets
    
    
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet private weak var temperatureLabel: UILabel!
    
    @IBOutlet private weak var maximumTemperatureLabel: UILabel!
    
    @IBOutlet private weak var minimumTemperatureLabel: UILabel!
    
    @IBOutlet private weak var thermalSensationLabel: UILabel!
    
    @IBOutlet private weak var sunriseLabel: UILabel!
    
    @IBOutlet private weak var pressureLabel: UILabel!
    
    @IBOutlet private weak var humidityLabel: UILabel!

    @IBOutlet private weak var latitudeLabel: UILabel!

    @IBOutlet private weak var longitudeLabel: UILabel!
   
    @IBOutlet weak var acitivityIndicator: UIActivityIndicatorView!

    private let vm = ViewModel()
    
    //MARK: - Initializers

    override func viewDidLoad() {
        configureUI()
        getWeatherInformation()
    }
    
    //MARK: - Private methods
    
    private func configureUI () {
        acitivityIndicator.isHidden = false
        acitivityIndicator.startAnimating()
}
    
    private func getData () {
        
        cityLabel.text = city?.cidade
        
        guard let temperature = weatherInformaton?.main?.temp else {return}
        guard let minimum = weatherInformaton?.main?.tempMin else {return}
        guard let maximum = weatherInformaton?.main?.tempMax else {return}
        guard let thermalSensation = weatherInformaton?.main?.feelsLike else {return}
        guard let sunrise = weatherInformaton?.sys?.sunrise else {return}
        guard let pressure = weatherInformaton?.main?.pressure else {return}

        guard let humidity = weatherInformaton?.main?.humidity else {return}
        guard let latitude = weatherInformaton?.coord?.lat else {return}
        guard let longitude = weatherInformaton?.coord?.lat else {return}

        temperatureLabel.text = String(temperature)
        minimumTemperatureLabel.text = String(minimum)
        maximumTemperatureLabel.text = String (maximum)
        thermalSensationLabel.text = String(thermalSensation)
        sunriseLabel.text = String(sunrise)
        pressureLabel.text = String (pressure)
        humidityLabel.text = String (humidity)
        latitudeLabel.text = String (latitude)
        longitudeLabel.text = String (longitude)
    }
    
    private func getWeatherInformation () {
        guard let latitude = city?.latitude else {return}
        guard let longitude = city?.longitude else {return}
        vm.fetchWeatherData(latitude: latitude, longitude: longitude) { weatherData in
            
            self.weatherInformaton = weatherData
           
            DispatchQueue.main.async {
                self.acitivityIndicator.stopAnimating()
                self.acitivityIndicator.isHidden = true
                self.getData()

            }
        }
    
    }
    
    
}
