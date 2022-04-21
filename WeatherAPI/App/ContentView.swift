//
//  ContentView.swift
//  WeatherAPI
//
//  Created by Mark Skurat on 3/14/22.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherService()
    @State var weather: ResponseBody?
    var weatherManager2 = WeatherService2()
    
    @State var weather2: Welcome?
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingScreen()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                weather2 = try await weatherManager2.getCurrentWeather(latitude: (location.latitude), longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingScreen()
                } else {
                    OnboardingView().environmentObject(locationManager)
                }
            }
        }
        .background(Color.red)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


