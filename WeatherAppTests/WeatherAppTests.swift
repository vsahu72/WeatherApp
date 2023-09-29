//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Vikash Sahu on 27/09/23.
//

import XCTest
@testable import WeatherApp

final class WeatherAppTests: XCTestCase {

    func test_success_fetch_weather_details_by_location_cordinate() {
        let expectation = XCTestExpectation(description: "Fetching weather details")
        WeatherDataRepository.shared.fetchWeatherDetails(latitude: "22.719568", longitude: "75.857727") { weatherResult in
            XCTAssertNotNil(weatherResult)
            XCTAssertNotNil(weatherResult.main?.temp)
            expectation.fulfill()
        } fail: {
            XCTAssert(false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

    func test_failure_fetch_weather_details_by_location_cordinate() {
        let expectation = XCTestExpectation(description: "Failed to Fetching weather details")
        WeatherDataRepository.shared.fetchWeatherDetails(latitude: "", longitude: "") { weatherResult in
            XCTAssertNotNil(weatherResult)
            XCTAssertNotNil(weatherResult.main?.temp)
            expectation.fulfill()
        } fail: {
            XCTAssert(true)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

    func test_success_fetch_weather_details_by_city_name() {
        let expectation = XCTestExpectation(description: "Fetching weather details by city name")
        WeatherDataRepository.shared.fetchWeatherDetails(cityName: "indore") { weatherResult in
            XCTAssertNotNil(weatherResult)
            XCTAssertNotNil(weatherResult.main?.temp)
            expectation.fulfill()
        } fail: {
            XCTAssert(false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

    func test_failure_fetch_weather_details_by_city_name() {
        let expectation = XCTestExpectation(description: "Failed to Fetching weather details by city name")
        WeatherDataRepository.shared.fetchWeatherDetails(cityName: "wqwqwqw") { weatherResult in
            XCTAssertNotNil(weatherResult)
            XCTAssertNotNil(weatherResult.main?.temp)
            expectation.fulfill()
        } fail: {
            XCTAssert(true)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
}
