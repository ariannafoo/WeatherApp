//
//  ContentView.swift
//  WeatherApp
//
//  Created by Arianna Foo on 2025-03-05.
//

import SwiftUI

struct ContentView: View {
    
    // Add stateobject so that the views can be notified/updated everytime published variables are changed
    @StateObject var locationManager = LocationManager()
    
    
    
    var body: some View {
        VStack {
            WelcomeView()
                .environmentObject(locationManager)
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
