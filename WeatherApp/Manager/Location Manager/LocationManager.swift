//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Vikash Sahu on 28/09/23.
//

import Foundation
import CoreLocation

protocol LocationProtocol: AnyObject {
    func didStartFetchingCurrentLocation()
    func didFinishToFetchCurrentLocation()
    func failedToFetchCurrentLocation()
}

class LocationManager: NSObject, CLLocationManagerDelegate {
    // Creating an instance of CLLocationManager, the framework we use to get the coordinates
    let manager = CLLocationManager()

    var location: CLLocationCoordinate2D?
    weak var delegate: LocationProtocol?

    override init() {
        super.init()
        // Assigning a delegate to our CLLocationManager instance
        manager.delegate = self
        manager.requestWhenInUseAuthorization()

    }

    func requestLocation() {
        manager.requestLocation()
        delegate?.didStartFetchingCurrentLocation()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .restricted:
            manager.requestWhenInUseAuthorization()
        case .denied:
            manager.requestWhenInUseAuthorization()
        case .authorizedAlways:
            manager.requestLocation()
        case .authorizedWhenInUse:
            manager.requestLocation()
        case .authorized:
            manager.requestLocation()
        @unknown default:
            fatalError()
        }
    }

    // Set the location coordinates to the location variable
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        delegate?.didFinishToFetchCurrentLocation()
    }

    // This function will be called if we run into an error
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        delegate?.failedToFetchCurrentLocation()
    }
}
