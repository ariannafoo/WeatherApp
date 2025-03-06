//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Arianna Foo on 2025-03-05.
//

import Foundation
import CoreLocation // Framework used to get user's current location

/**
 CLLocationManagerDelegate - Protocol that allows your class to respond to location updates. It helps handle location cahnges, authorization status updates, errors, etc.
 NSObject - Super class. CLLocationManagerDelegate is an Objective-C protocol, and inheriting from NSObject makes the class compatible with it
 ObservableObject - Lets SwiftUI observe changes in this class. When a property is marked with @Published changes, SwiftUI views automatically update. */

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    // Need these functions to make the CLLocationManagerDelegate work
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate // locations array of CLLocations
        isLoading = false // obtained the location so that state is not loading anymore
    }
    
    // Function to handle errors
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Error geting location", error)
        isLoading = false
    }
    
}
