//
//  DetailViewController.swift
//  OpenWeather
//
//  Created by vitor henrique on 06/09/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Properties
    
    public var city:City?
    private var weatherInformaton: Welcome?
    private let vm = ViewModel()

    
    //MARK: - Outlets
    
    @IBOutlet private weak var firstView: UIView!
    
    @IBOutlet private weak var secondView: UIView!
    
    @IBOutlet private weak var weatherStackView: UIStackView!
    
    @IBOutlet private weak var watherDescriptionLabel: UILabel!
    
    @IBOutlet private weak var cityLabel: UILabel!
    
    @IBOutlet private weak var temperatureLabel: UILabel!
    
    @IBOutlet private weak var maximumTemperatureLabel: UILabel!
    
    @IBOutlet private weak var minimumTemperatureLabel: UILabel!
    
    @IBOutlet private weak var thermalSensationLabel: UILabel!
    
    @IBOutlet private weak var sunriseLabel: UILabel!
    
    @IBOutlet private weak var pressureLabel: UILabel!
    
    @IBOutlet private weak var humidityLabel: UILabel!
    
    @IBOutlet private weak var latitudeLabel: UILabel!
    
    @IBOutlet private weak var longitudeLabel: UILabel!
    
    @IBOutlet private weak var acitivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet private weak var footerInformation: NSLayoutConstraint!
    
    @IBOutlet private weak var footerLabel: UILabel!
    
    
    //MARK: - Initializers
    
    override func viewDidLoad() {
        configureUI()
        getWeatherInformation()
    }
    
    //MARK: - Private methods
    
    private func configureUI () {
        acitivityIndicator.isHidden = false
        acitivityIndicator.startAnimating()
        weatherStackView.isHidden = true
        firstView.isHidden = true
        secondView.isHidden = true
        configureTextForFooter()
        firstView.layer.cornerRadius = 10
        secondView.layer.cornerRadius = 10
        weatherStackView.layer.cornerRadius = 10
    }
    
    private func configureTextForFooter () {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm Z"
        let now = Date()
        let dateString = formatter.string(from:now)
        NSLog("%@", dateString)
        print (dateString)
        createTextForFooter(date: dateString)
    }
    
  
    
    
    
  
    
    
  
    
    private func createTextForFooter (date: String) {
        let numberMonth = date[date.index(date.startIndex, offsetBy: 4)]
        let month = DateUtils.getMonthName(month: String(numberMonth))
        guard let dayOfWeek = Date().dayOfWeek() else {return}
    
        let footerText = "\(dayOfWeek), \(DateUtils.getDay()) de \(month) de \(DateUtils.getYear()) - \( DateUtils.getCurrentHour())"
        footerLabel.text = footerText
    }
    
    
 
    
    private func getData () {
        
        cityLabel.text = city?.cidade
        
        guard let description = weatherInformaton?.weather else {return}
        guard let temperature =  weatherInformaton?.main?.temp else {return}
        
        guard let minimum = weatherInformaton?.main?.tempMin else {return}
        guard let maximum = weatherInformaton?.main?.tempMax else {return}
        guard let thermalSensation = weatherInformaton?.main?.feelsLike else {return}
        guard let sunrise = weatherInformaton?.sys?.sunrise else {return}
        guard let pressure = weatherInformaton?.main?.pressure else {return}
        
        guard let humidity = weatherInformaton?.main?.humidity else {return}
        guard let latitude = weatherInformaton?.coord?.lat else {return}
        guard let longitude = weatherInformaton?.coord?.lat else {return}
        
        temperatureLabel.text = "\(NumberUtils.roundNumber(value: temperature))°C"
        minimumTemperatureLabel.text = "\(NumberUtils.roundNumber(value: minimum))°C"
        maximumTemperatureLabel.text = "\(NumberUtils.roundNumber(value: maximum))°C"
        thermalSensationLabel.text = "\(NumberUtils.roundNumber(value: thermalSensation))°C"
        sunriseLabel.text = String(DateUtils.formateHour(interval: sunrise))
        pressureLabel.text = String (pressure)
        humidityLabel.text = "\(String (humidity)) %"
        latitudeLabel.text = String (latitude)
        longitudeLabel.text = String (longitude)
        
        getWeatherDescription(description: description)
        
        weatherStackView.isHidden = false
        firstView.isHidden = false
        secondView.isHidden = false
    }
    
    private func getWeatherDescription (description: [Weather]) {
        for i in description {
            guard let desc = i.weatherDescription else {return}
            watherDescriptionLabel.text = String(desc)
        }
        
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





