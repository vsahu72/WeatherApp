//
//  ViewModel.swift
//  WeatherApp
//
//  Created by Vikash Sahu on 29/09/23.
//

import Foundation

public class ViewModel {
    // Flow coordinator
    var coordinator: Coordinator?

    init(withCoordinator: Coordinator?) {
        coordinator = withCoordinator
    }
}
