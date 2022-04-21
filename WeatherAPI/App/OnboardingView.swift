//
//  OnboardingView.swift
//  WeatherAPI
//
//  Created by Mark Skurat on 3/22/22.
//

import SwiftUI
import CoreLocationUI

struct OnboardingView: View {
    
    @StateObject var vm = WeatherAPIViewModel()
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack {
            VStack(spacing: 25) {
                Text("Welcome to the Weather App")
                    .font(.largeTitle)
                Text("Please share your location to get the weather in your area!")
                    .padding()
    
            }
            
            .multilineTextAlignment(.center)
            .padding()
            
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
