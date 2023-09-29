//
//  WeatherCoordinator.swift
//  WeatherApp
//
//  Created by Vikash Sahu on 29/09/23.
//

import Foundation
import UIKit

// MARK: - WeatherEvent
enum WeatherEvent: Event {
    case searchWeather
}

class WeatherCoordinator: Coordinator {

    private weak var root: WeatherViewController?

    /* Getter method for root */
    public func initialViewController() -> WeatherViewController? {
        return root
    }

    override init(parent: Coordinator?) {
        super.init(parent: parent)
        weatherEventHandler()
    }

    public func createFlow(dueDate: String? = nil) -> UIViewController {
        root = UIStoryboard.mainStoryboard().instantiateViewController(
            forClass: WeatherViewController.self)

        let viewModel = WeatherViewModel(withCoordinator: self)
        root?.weatherViewModel = viewModel
        return root ?? UIViewController()
    }
}

extension WeatherCoordinator {
    func weatherEventHandler() {
        addHandler { [weak self] (event: WeatherEvent) in
            switch event {
            case .searchWeather:
                self?.navigateToSearchWeatherVC()
            }
        }
    }
}

extension WeatherCoordinator {
    func navigateToSearchWeatherVC() {
        guard let vController = UIStoryboard.mainStoryboard().instantiateViewController(
            forClass: SearchWeatherViewController.self)
            else { return }
        let viewModel = SearchWeatherViewModel(withCoordinator: self)
        vController.searchWeatherViewModel = viewModel
        vController.hidesBottomBarWhenPushed = true
        root?.navigationController?.pushViewController(vController, animated: true)
    }
}
