//
//  ViewController.swift
//  WeatherApp
//
//  Created by Vikash Sahu on 27/09/23.
//

import UIKit
// API keY: 3a263e0a7e0eb745dd283737979dea5e

class WeatherViewController: BaseViewController {

    @IBOutlet weak var weatherView: UIView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var miniTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var weatherTypeImage: UIImageView!
    @IBOutlet weak var bacgroundImage: UIImageView!

    var weatherViewModel = WeatherViewModel()
    var locationManager = LocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherViewModel.delegate = self
        locationManager.delegate = self
        weatherView.isHidden = true
        locationManager.requestLocation()
    }

    func pupulateValues() {
        cityNameLabel.text = weatherViewModel.cityName
        dateLabel.text = "\(weatherViewModel.date)"
        weatherTypeLabel.text = "\(weatherViewModel.weatherType)"
        currentTempLabel.text = "\(weatherViewModel.currentTemperature)"
        miniTempLabel.text = "\(weatherViewModel.minimumTemperature)"
        maxTempLabel.text = "\(weatherViewModel.maximumTemperature)"
        windSpeedLabel.text = "\(weatherViewModel.windSpeed)"
        humidityLabel.text = "\(weatherViewModel.humidity)"
       // weatherTypeImage.image = UIImage(systemName: "sun.min.fill")
        bacgroundImage.image = UIImage(resource: .city)

    }

    @IBAction func searchButtonAction(_ sender: Any) {
        let searchWeatherViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SearchWeatherViewController") as? SearchWeatherViewController
        self.navigationController?.pushViewController(searchWeatherViewController!, animated: true)
    }
}

extension WeatherViewController: WeatherDelegate {
    func didStartLodingingWeatherDetails() {

    }

    func didFinishToLoadWeatherDetails() {
        DispatchQueue.main.async {
            self.weatherView.isHidden = false
            self.pupulateValues()
        }
    }

    func failedToLoadWeatherDetails() {

    }
}

extension WeatherViewController: LocationProtocol {
    func didStartFetchingCurrentLocation() {

    }

    func didFinishToFetchCurrentLocation() {
        guard let location = locationManager.location else { return }
        let latitude = String(location.latitude)
        let longitde = String(location.longitude)
        weatherViewModel.fetchWeatherDetails(latitude: latitude, longitude: longitde)
    }

    func failedToFetchCurrentLocation() {

    }

}
