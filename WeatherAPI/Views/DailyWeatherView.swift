//
//  DailyWeatherView.swift
//  WeatherAPI
//
//  Created by Mark Skurat on 3/23/22.
//

import SwiftUI

struct DailyWeatherView: View {
    
    @StateObject var vm = WeatherAPIViewModel()
    
    
    var body: some View {
        ScrollView {
            HStack {
                HStack {
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(vm.days) { day in
                            HStack {
                                HStack {
                                    Text(secondsToDays(unix: Double(day.dt!)))
                                    Spacer()
                                    let iconString = day.weather?.first?.icon ?? ""
                                    let iconEmoji = Icon(iconString)
                                    Text(iconEmoji.emojiIcon())
                                        .font(.system(size: 25))
                                }
                                
                                HStack {
                                    Spacer()
                                    if day.pop! >= 0.2 {
                                        Text(String(day.pop?.decimalToPercent() ?? ""))
                                            .foregroundColor(.blue)
                                            .offset(x: -20)
                                        Spacer()
                                    }
                                }
                                Text(String((day.temp?.max?.roundDouble())! + "°"))
//                                    .padding(.horizontal)
                                Text(String((day.temp?.min?.roundDouble())! + "°"))
                                    .foregroundColor(.secondary)
                                    .padding(.horizontal, 4)
                                
                            }
                        }
                        
                    }
                }
            }
            .padding()
        }
    }
}

func secondsToDays(unix: Double) -> String {
    let date = Date(timeIntervalSince1970: unix)
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"
    return dateFormatter.string(from: date)
}

extension Double {
    func decimalToPercent() -> String {
        return "\(Int(self * 10) * 10)%"
    }
}


struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView()
            .preferredColorScheme(.dark)
    }
}
