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
    private var delegate:ViewModelProtocol?
    
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
        configureDelegates()
        getWeatherInformation()
    }
    
    //MARK: - Private methods
    
    private func configureUI () {
        configureActivityIndicator()
        hiddenSubViews()
        firstView.layer.cornerRadius = 10
        secondView.layer.cornerRadius = 10
        weatherStackView.layer.cornerRadius = 10
        self.title = LocalizableString.Details.view_tittle    }
    
    private func configureActivityIndicator () {
        acitivityIndicator.isHidden = false
        acitivityIndicator.startAnimating()
    }
    
    private func hiddenSubViews() {
        weatherStackView.isHidden = true
        firstView.isHidden = true
        secondView.isHidden = true
    }
    
    private func configureDelegates() {
        self.delegate = ViewModel(weatherService: OpenWeatherService(), apiService: ApiService())
    }
    
    private func createTextForFooter () {
        guard let timeZone = weatherInformaton?.timezone else {return}
        guard let dt = weatherInformaton?.dt else {return}
        
        let footerText = "\(DateUtils.getCurrentHourFooter(timeZone: timeZone, dt: dt))"
        
        footerLabel.text = footerText
    }
    
    private func getData () {
        cityLabel.text = city?.cidade
        
        guard let description = weatherInformaton?.weather,
              let temperature =  weatherInformaton?.main?.temp,
              let minimum = weatherInformaton?.main?.tempMin,
              let maximum = weatherInformaton?.main?.tempMax,
              let thermalSensation = weatherInformaton?.main?.feelsLike,
              let sunrise = weatherInformaton?.sys?.sunrise,
              let pressure = weatherInformaton?.main?.pressure,
              let humidity = weatherInformaton?.main?.humidity,
              let latitude = weatherInformaton?.coord?.lat,
              let longitude = weatherInformaton?.coord?.lat else {return}
        
        configureFields(temperature: temperature, minimum: minimum, maximum: maximum, thermalSensation: thermalSensation, sunrise: sunrise, pressure: pressure, humidity: humidity, latitude: latitude, longitude: longitude, description: description)
        
        showSubViews()
    }
    
    private func configureFields (temperature: Double, minimum: Double, maximum: Double, thermalSensation: Double, sunrise: Int, pressure: Int, humidity: Int, latitude: Double, longitude: Double, description: [Weather] ) {
        
        guard let timeZone = weatherInformaton?.timezone else {return}
        
        temperatureLabel.text = "\(NumberUtils.roundNumber(value: temperature)) °C"
        minimumTemperatureLabel.text = "\(NumberUtils.roundNumber(value: minimum)) °C"
        maximumTemperatureLabel.text = "\(NumberUtils.roundNumber(value: maximum)) °C"
        thermalSensationLabel.text = "\(NumberUtils.roundNumber(value: thermalSensation)) °C"
        sunriseLabel.text = String(DateUtils.getCurrentHour(timeInterval: sunrise, timeZone: timeZone))
        pressureLabel.text = String (pressure)
        humidityLabel.text = "\(String (humidity)) %"
        latitudeLabel.text = String (NumberUtils.roundNumberWithComma(value: latitude))
        longitudeLabel.text = String (NumberUtils.roundNumberWithComma(value: longitude))
        watherDescriptionLabel.text = description.first?.weatherDescription
    }
    
    private func showSubViews () {
        weatherStackView.isHidden = false
        firstView.isHidden = false
        secondView.isHidden = false
    }
    
    private func getWeatherInformation () {
        guard let latitude = city?.latitude else {return}
        guard let longitude = city?.longitude else {return}
        
        delegate?.fetchWeatherData(latitude: latitude, longitude: longitude) { weatherData in
            
            self.weatherInformaton = weatherData
            
            DispatchQueue.main.async {
                self.createTextForFooter()
                self.acitivityIndicator.stopAnimating()
                self.acitivityIndicator.isHidden = true
                self.getData()
            }
        }
    }
}








