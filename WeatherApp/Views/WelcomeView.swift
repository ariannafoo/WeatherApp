//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Arianna Foo on 2025-03-06.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    /**
     A shared observable object (conforming to ObservableObject) is created at a higher level in the view hierarchy.
     Child views can access it using @EnvironmentObject, without explicitly passing it as a parameter.
     */
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack{
            VStack(spacing: 20) {
                Text("Welcome to the Weather App")
                    .bold().font(.title)
                Text("Please share your current location to get the weather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                // Action we want to perform when the user clicks this button
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill) // button icon/symbol will be filled
            .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // takes up whole screen
    }
}

#Preview {
    WelcomeView()
}
