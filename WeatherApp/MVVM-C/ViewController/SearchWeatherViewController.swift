//
//  SearchWeatherViewController.swift
//  WeatherApp
//
//  Created by Vikash Sahu on 28/09/23.
//

import UIKit

class SearchWeatherViewController: BaseViewController {

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
    @IBOutlet weak var searchTextField: UITextField!

    var searchWeatherViewModel = SearchWeatherViewModel()
    var locationManager = LocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchWeatherViewModel.delegate = self
        self.weatherView.isHidden = true
    }

    func pupulateValues() {
        cityNameLabel.text = searchWeatherViewModel.cityName
        dateLabel.text = "\(searchWeatherViewModel.date)"
        weatherTypeLabel.text = "\(searchWeatherViewModel.weatherType)"
        currentTempLabel.text = "\(searchWeatherViewModel.currentTemperature)"
        miniTempLabel.text = "\(searchWeatherViewModel.minimumTemperature)"
        maxTempLabel.text = "\(searchWeatherViewModel.maximumTemperature)"
        windSpeedLabel.text = "\(searchWeatherViewModel.windSpeed)"
        humidityLabel.text = "\(searchWeatherViewModel.humidity)"
       // weatherTypeImage.image = UIImage(systemName: "sun.min.fill")
        bacgroundImage.image = UIImage(resource: .city)

    }

    @IBAction func searchButtonAction(_ sender: Any) {
        searchWeatherViewModel.fetchWeatherDetails(cityName: searchTextField.text ?? "")
    }

    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension SearchWeatherViewController: SearchWeatherDelegate {
    func didStartSearchingWeatherDetails() {

    }

    func didFinishToSearchWeatherDetails() {
        DispatchQueue.main.async {
            self.weatherView.isHidden = false
            self.pupulateValues()
        }
    }

    func failedToSearchWeatherDetails() {
        DispatchQueue.main.async {
            self.weatherView.isHidden = true
        }
    }

}
