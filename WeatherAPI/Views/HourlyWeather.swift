//
//  HourlyTemp.swift
//  WeatherAPI
//
//  Created by Mark Skurat on 3/22/22.
//

import SwiftUI

struct HourlyWeather: View {
    
    @StateObject var vm = WeatherAPIViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    
                    HStack(spacing: 17) {
                        ForEach(vm.hours) { hour in
                            VStack(spacing: 17){
                                Text((secondsToHours(unix: Double(hour.dt!))))

                                if hour.pop! >= 0.3 {
                                    Text(String(hour.pop?.decimalToPercent() ?? ""))
                                        .foregroundColor(.blue)
                                        .font(.footnote)
                                        .padding(.vertical, -6)
                                    
                                } else {
                                    Text(" ")
                                        .foregroundColor(.blue)
                                        .font(.footnote)
                                        .padding(.vertical, -6)
                                }
                                
                                let iconString = hour.weather?.first?.icon ?? ""
                                let iconEmoji = Icon(iconString)
                                Text(iconEmoji.emojiIcon())
                                    .font(.system(size: 30).bold())
                                Text(String(hour.temp!.roundDouble()))
                                    .padding(.vertical, 8)
                            }
                        }
                    }
                   
                }
            }
        }
        .frame(width: 350, height: 120)
    }
    
}

func secondsToHours(unix: Double) -> String {
    let date = Date(timeIntervalSince1970: unix)
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "ha"
    return dateFormatter.string(from: date)
}

struct HourlyTemp_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeather()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
