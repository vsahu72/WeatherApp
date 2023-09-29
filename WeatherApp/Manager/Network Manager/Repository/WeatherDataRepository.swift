//
//  WeatherDataRepository.swift
//  WeatherApp
//
//  Created by Vikash Sahu on 28/09/23.
//

import Foundation

class WeatherDataRepository {
    public static let shared = WeatherDataRepository()
    let apiKey = "3a263e0a7e0eb745dd283737979dea5e"
    let baseURL = "https://api.openweathermap.org/data/2.5/weather"

    func fetchWeatherDetails(latitude: String, longitude: String, success: @escaping ((WeatherDetails) -> Void), fail : @escaping (() -> Void)) {
        NetworkManager.shared.executeWith(urlString: "\(baseURL)?lat=\(latitude)8&lon=\(longitude)&appid=\(apiKey)&units=metric") { (response: WeatherDetails) in
            success(response)
        } fail: {
            fail()
        }
    }

    func fetchWeatherDetails(cityName: String, success: @escaping ((WeatherDetails) -> Void), fail : @escaping (() -> Void)) {
        NetworkManager.shared.executeWith( urlString: "\(baseURL)?q=\(cityName)&appid=\(apiKey)&units=metric") { (response: WeatherDetails) in
            success(response)
        } fail: {
            fail()
        }
    }
}
