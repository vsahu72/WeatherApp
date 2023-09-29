//
//  WeatherDetails.swift
//  WeatherApp
//
//  Created by Vikash Sahu on 28/09/23.
//

import Foundation

// MARK: - WeatherDetails
struct WeatherDetails: Codable {
    let coord: Coord?
    let weather: [Weather]?
    let base: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let date: Int?
    let sysDetails: SysDetails?
    let timezone: Int?
    let weatherId: Int?
    let name: String?
    let cod: Int?

    enum CodingKeys: String, CodingKey {
        case coord
        case weather
        case base
        case main
        case visibility
        case wind
        case clouds
        case date = "dt"
        case sysDetails = "sys"
        case timezone
        case weatherId = "id"
        case name
        case cod
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int?
}

// MARK: - Coord
struct Coord: Codable {
    let lon: Double?
    let lat: Double?
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, humidity: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct SysDetails: Codable {
    let type: Int?
    let sysDetailsId: Int?
    let country: String?
    let sunrise: Int?
    let sunset: Int?

    enum CodingKeys: String, CodingKey {
        case type
        case sysDetailsId = "id"
        case country
        case sunrise
        case sunset
    }
}

// MARK: - Weather
struct Weather: Codable {
    let weatherId: Int?
    let main: String?
    let description: String?
    let icon: String?

    enum CodingKeys: String, CodingKey {
        case weatherId = "id"
        case main
        case description
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double?
    let deg: Int?
}
