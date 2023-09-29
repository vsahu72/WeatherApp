//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Vikash Sahu on 28/09/23.
//

import Foundation

protocol WeatherDelegate: AnyObject {
    func didStartLodingingWeatherDetails()
    func didFinishToLoadWeatherDetails()
    func failedToLoadWeatherDetails()
}

class WeatherViewModel {

    var weatherDetails: WeatherDetails?
    weak var delegate: WeatherDelegate?

    var cityName: String {
        return weatherDetails?.name ?? ""
    }

    var date: String {
        return "Today, \(Date().formatted(.dateTime.month().day().hour().minute()))"
    }

    var weatherType: String {
        return weatherDetails?.weather?.first?.main ?? ""
    }

    var currentTemperature: String {
        return (weatherDetails?.main?.temp?.roundDouble() ?? "-") + ("°")
    }

    var minimumTemperature: String {
        return (weatherDetails?.main?.tempMin?.roundDouble() ?? "-") + ("°")
    }

    var maximumTemperature: String {
        return (weatherDetails?.main?.tempMax?.roundDouble() ?? "-") + ("°")
    }

    var windSpeed: String {
        return (weatherDetails?.wind?.speed?.roundDouble() ?? "-") + (" m/s")
    }

    var humidity: String {
        return String(weatherDetails?.main?.humidity ?? 0) + ("%")
    }
}

extension WeatherViewModel {
    func fetchWeatherDetails(latitude: String, longitude: String) {
        delegate?.didStartLodingingWeatherDetails()
        WeatherDataRepository.shared.fetchWeatherDetails(latitude: latitude, longitude: longitude) { [weak self] weatherResult in
            self?.weatherDetails = weatherResult
            self?.delegate?.didFinishToLoadWeatherDetails()
        } fail: { [weak self] in
            self?.delegate?.failedToLoadWeatherDetails()
        }

    }
}
