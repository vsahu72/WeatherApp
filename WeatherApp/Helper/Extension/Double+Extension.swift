//
//  Double+Extension.swift
//  WeatherApp
//
//  Created by Vikash Sahu on 28/09/23.
//

import Foundation

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}
