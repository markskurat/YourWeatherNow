//
//  WeatherView.swift
//  WeatherAPI
//
//  Created by Mark Skurat on 4/15/22.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject var vm = WeatherAPIViewModel()
    var weather: ResponseBody
    
    var body: some View {
        
        // MARK: - HEADER
        NavigationView {
            VStack {
                ZStack {
                    ScrollView {
                        VStack {
                            // MARK: - HEADERVIEW
                            HeaderView()
                                .padding(.bottom, 70)
                            // MARK: - HORRIZONTAL SCROLLVIEW
                            Divider()
                                .offset(y: -25)
                            HourlyWeather()
                            Divider()
                                .offset(y: 18)
                            
                            
                            DailyWeatherView()
                            Divider()
                            DescriptionView()
                            Divider()
                            
                            VStack {
                                sunriseSunset
                                windHumidity
                                pressureFeelslike
                                visibilityUVIndex
                            }
                        }
                        .foregroundColor(.white)
                    }
                }
                Divider()
                
                SourceLinkView()
                    .offset(x: -140, y: 55)
                
            }
            .padding(.vertical, 90)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(LinearGradient(gradient: Gradient(colors: [Color("ColorBlueLight"), Color("ColorBlueDark")]), startPoint: .topLeading, endPoint: .bottomTrailing)).edgesIgnoringSafeArea(.all)
        }
        
    }
}

func exactTime(unix: Double) -> String {
    let date = Date(timeIntervalSince1970: unix)
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "h: mm a"
    return dateFormatter.string(from: date)
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}


extension WeatherView {
    private var sunriseSunset: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Sunrise".uppercased())
                            .foregroundColor(.white.opacity(0.6))
                        Text(String(exactTime(unix: Double(vm.current?.sunrise ?? 0))))
                            .font(.title)
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Sunset".uppercased())
                            .foregroundColor(.white.opacity(0.6))
                        Text(String(exactTime(unix: Double(vm.current?.sunset ?? 0))))
                            .font(.title)
                    }
                    .offset(x: -30)
                }
                
            }
            .padding(.horizontal, 20)
            .foregroundColor(.white)
        }
    }
    private var windHumidity: some View {
        ZStack {
            VStack {
                Divider()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Wind".uppercased())
                            .foregroundColor(.white.opacity(0.6))
                        Text(String(vm.current?.wind_speed?.roundDouble() ?? "") + " mph")
                            .font(.title)
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Humidity".uppercased())
                            .foregroundColor(.white.opacity(0.6))
                        Text(String(vm.current?.humidity ?? 0) + "%")
                        
                            .font(.title)
                    }
                    .offset(x: -60)
                }
                
            }
            .padding(.horizontal, 20)
            .foregroundColor(.white)
        }
    }
    private var pressureFeelslike: some View {
        ZStack {
            VStack {
                Divider()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Pressure".uppercased())
                            .foregroundColor(.white.opacity(0.6))
                        Text("\(Double(Float(vm.current?.pressure ?? 0) * (0.02953)).round2Decimals()) inHg")
                        
                            .font(.title)
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Feels like".uppercased())
                            .foregroundColor(.white.opacity(0.6))
                        Text(String(vm.current?.feels_like?.roundDouble() ?? "") + "°")
                            .font(.title)
                    }
                    .offset(x: -50)
                }
                
            }
            .padding(.horizontal, 20)
            .foregroundColor(.white)
        }
    }
    
    private var visibilityUVIndex: some View {
        ZStack {
            VStack {
                Divider()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Visibility".uppercased())
                            .foregroundColor(.white.opacity(0.6))
                        Text("\((vm.current?.visibility ?? 0) / 1000) mi")
                            .font(.title)
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("UV Index".uppercased())
                            .foregroundColor(.white.opacity(0.6))
                        Text(String(vm.current?.uvi?.roundDouble() ?? ""))
                            .font(.title)
                    }
                    .offset(x: -60)
                }
                
            }
            .padding(.horizontal, 20)
            .foregroundColor(.white)
        }
    }
}
