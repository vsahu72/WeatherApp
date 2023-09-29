//
//  AppCoordinator.swift
//  WeatherApp
//
//  Created by Vikash Sahu on 29/09/23.
//

import Foundation
import UIKit

typealias VoidCompletion = () -> Void

public final class AppCoordinator: Coordinator {

    private unowned let window: UIWindow

    public init(window: UIWindow) {
        self.window = window
        super.init(parent: nil)
    }

    public func startFlow() {
        presentMainFlow()
    }
}

extension AppCoordinator {

     func presentMainFlow() {
        self.removeAllChildrens()
        let weatherCoordinator = WeatherCoordinator(parent: self)
        let newRootVC = weatherCoordinator.createFlow()
        let navController = UINavigationController(rootViewController: newRootVC)
        navController.isNavigationBarHidden = true
        navController.navigationItem.hidesBackButton = true
        self.window.rootViewController = navController
        self.window.makeKeyAndVisible()
    }
}
