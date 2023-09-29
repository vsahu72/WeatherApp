//
//  WeatherDataRepository.swift
//  WeatherApp
//
//  Created by Vikash Sahu on 28/09/23.
//

import Foundation

class WeatherDataRepository{
    public static let shared = WeatherDataRepository()
    
    func fetchMovies(latitude: String, longitude: String, success: @escaping ((WeatherDetails)-> Void), fail : @escaping (()->Void)){
        
        NetworkManager.shared.executeWith(urlString: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)8&lon=\(longitude)&appid=3a263e0a7e0eb745dd283737979dea5e&units=metric") { (response : WeatherDetails) in
            success(response)
        } fail: {
           fail()
        }
    }
}
