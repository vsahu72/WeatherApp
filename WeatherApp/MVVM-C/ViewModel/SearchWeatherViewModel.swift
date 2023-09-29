//
//  SearchWeatherViewModel.swift
//  WeatherApp
//
//  Created by Vikash Sahu on 28/09/23.
//

import Foundation

protocol SearchWeatherDelegate: AnyObject {
    func didStartSearchingWeatherDetails()
    func didFinishToSearchWeatherDetails()
    func failedToSearchWeatherDetails()
}

class SearchWeatherViewModel: ViewModel {

    var weatherDetails: WeatherDetails?
    weak var delegate: SearchWeatherDelegate?

    override init(withCoordinator: Coordinator?) {
        super.init(withCoordinator: withCoordinator)
    }
    
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

extension SearchWeatherViewModel {
    func fetchWeatherDetails(cityName: String) {
        delegate?.didStartSearchingWeatherDetails()
        WeatherDataRepository.shared.fetchWeatherDetails(cityName: cityName) { [weak self] weatherResult in
            self?.weatherDetails = weatherResult
            self?.delegate?.didFinishToSearchWeatherDetails()
        } fail: { [weak self] in
            self?.delegate?.failedToSearchWeatherDetails()
        }
    }
}
