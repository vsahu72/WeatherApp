//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Vikash Sahu on 28/09/23.
//

import Foundation

class NetworkManager {
    public static let shared = NetworkManager()

    func executeWith<T: Decodable>(urlString: String, success: @escaping ((T) -> Void), fail: @escaping (() -> Void)) {

        let url = URL(string: urlString)
        guard let urlObject = url else {return}
        let session = URLSession.shared
        var request = URLRequest(url: urlObject)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest) { data, _, error in
            guard error == nil else {return}
            guard let data = data else {return}
            let decoder = JSONDecoder()

            if let json = try? decoder.decode(T.self, from: data) {
                success(json)
            } else {
                fail()
            }
        }
        task.resume()
    }
}
