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
    
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var weatherStackView: UIStackView!
    
    @IBOutlet weak var watherDescriptionLabel: UILabel!
    
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

    @IBOutlet weak var footerInformation: NSLayoutConstraint!
    
    @IBOutlet weak var footerLabel: UILabel!

    
    
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
        weatherStackView.isHidden = true
        firstView.isHidden = true
        secondView.isHidden = true
        configureTextForFooter()
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
    
    private func getCurrentHour () -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm Z"
        let now = Date()
        var dateString = formatter.string(from:now)
        NSLog("%@", dateString)
        print (dateString)
        dateString.removeLast(5)
        dateString.removeFirst(11)
        print ("A Hora é \(dateString)")
        return dateString
    }
    
  
    
    
    private func createTextForFooter (date: String) {
        let numberMonth = date[date.index(date.startIndex, offsetBy: 4)]
        let month = Utils.getMonthName(month: String(numberMonth))
        guard let dayOfWeek = Date().dayOfWeek() else {return}
        let hour = getCurrentHour()
        let footerText = "\(dayOfWeek), 08 de \(month) de 2022 - \(hour)"
        footerLabel.text = footerText
    }
    
    
    
    private func getData () {
        
        cityLabel.text = city?.cidade
        
        guard let description = weatherInformaton?.weather else {return}
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


extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}


