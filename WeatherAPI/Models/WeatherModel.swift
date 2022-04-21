//
//  WeatherModel.swift
//  WeatherAPI
//
//  Created by Mark Skurat on 3/22/22.
//

import Foundation
import CoreLocation

// MARK: - Welcome
//struct JSONResponse: Codable {
//    let lat, lon: Double?
//    let timezone: String?
//    let timezoneOffset: Int?
//    let current: CurrentConditions?
//    let hourly: [CurrentConditions]?
//    let daily: [Daily]?
//}
//
//// MARK: - CurrentConditions
//struct CurrentConditions: Codable, Identifiable {
//    var id = UUID().uuidString
//    let dt, sunrise, sunset: Int?
//    let temp, feels_like: Double?
//    let pressure, humidity: Int?
//    let dewPoint, uvi: Double?
//    let clouds, visibility: Int?
//    let wind_speed: Double?
//    let wind_deg: Int?
//    let wind_gust: Double?
//    let weather: [Weather]?
//    let pop: Double?
//    
//    enum CodingKeys: String, CodingKey {
//        case dt, sunrise, sunset
//        case temp, feels_like
//        case pressure, humidity
//        case dewPoint, uvi
//        case clouds, visibility
//        case wind_speed
//        case wind_deg
//        case wind_gust
//        case weather
//        case pop
//    }
//}
//
//struct Weather: Codable, Identifiable {
//    let id: Int?
//    let main: String?
//    let description: String?
//    let icon: String?
//    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case main
//        case description
//        case icon
//    }
//}
//
//
//enum Icon: Codable {
//    
//    func emojiIcon() -> String {
//        switch self {
//        case .the01d:
//            return "☀️"
//        case .the01n:
//            return "☁️"
//        case .the02n:
//            return "☁️"
//        case .the02d:
//            return "🌤"
//        case .the03d:
//            return "⛅️"
//        case .the03n:
//            return "☁️"
//        case .the04d:
//            return "🌥"
//        case .the04n:
//            return "☁️"
//        case .the09n:
//            return "🌦"
//        case .the09d:
//            return "🌦"
//        case .the11n:
//            return "⛈"
//        case .the11d:
//            return "⛈"
//        case .the13d:
//            return "❄️"
//        case .the13n:
//            return "❄️"
//        case .the10n:
//            return "🌧"
//        case .the10d:
//            return "🌧"
//        case .the50n:
//            return "🌫"
//        case .the50d:
//            return "🌫"
//            
//        }
//    }
//    
//    init(_ string: String){
//        switch string{
//        case "01d":
//            self = .the01d
//        case "01n":
//            self = .the01n
//        case "02n":
//            self = .the02n
//        case "02d":
//            self = .the02d
//        case "03d":
//            self = .the03d
//        case "03n":
//            self = .the03n
//        case "04d":
//            self = .the04d
//        case "04n":
//            self = .the04n
//        case "09n":
//            self = .the09n
//        case "09d":
//            self = .the09d
//        case "10n":
//            self = .the10n
//        case "10d":
//            self = .the10d
//        case "11n":
//            self = .the11n
//        case "11d":
//            self = .the11d
//        case "13d":
//            self = .the13d
//        case "13n":
//            self = .the13n
//        case "50n":
//            self = .the50n
//        case "50d":
//            self = .the50d
//        default:
//            self = .the01d
//        }
//    }
//    
//    enum CodingKeys: String, CodingKey {
//        case the01d = "01d"
//        case the01n = "01n"
//        case the02n = "02n"
//        case the02d = "02d"
//        case the03d = "03d"
//        case the03n = "03n"
//        case the04d = "04d"
//        case the04n = "04n"
//        case the09n = "09n"
//        case the09d = "09d"
//        case the10n = "10n"
//        case the10d = "10d"
//        case the11n = "11n"
//        case the11d = "11d"
//        case the13d = "13d"
//        case the13n = "13n"
//        case the50n = "50n"
//        case the50d = "50d"
//    }
//    
//    case the01d
//    case the01n
//    case the02n
//    case the02d
//    case the03d
//    case the03n
//    case the04d
//    case the04n
//    case the09n
//    case the09d
//    case the10n
//    case the10d
//    case the11n
//    case the11d
//    case the13d
//    case the13n
//    case the50n
//    case the50d
//}
//
//enum Main: Codable {
//    func mainDescription() -> String {
//        switch self {
//        case .clear:
//            return "Clear"
//        case .clouds:
//            return "Clouds"
//        case .snow:
//            return "Snow"
//        case .rain:
//            return "Rain"
//        case .thunderstorm:
//            return "Thunderstorm"
//        case .drizzle:
//            return "Drizzle"
//        case .mist:
//            return "Mist"
//        case .smoke:
//            return "Smoke"
//        case .fog:
//            return "Fog"
//        case .haze:
//            return "Haze"
//        case .dust:
//            return "Dust"
//        case .sand:
//            return "Sand"
//        case .ash:
//            return "Ash"
//        case .squall:
//            return "Squall"
//        case .tornado:
//            return "Tornado"
//        }
//    }
//    
//    init(_ string: String) {
//        switch string {
//        case "Clear":
//            self = .clear
//        case "Clouds":
//            self = .clouds
//        case "Snow":
//            self = .snow
//        case "Rain":
//            self = .rain
//        case "Thunderstorm":
//            self = .thunderstorm
//        case "Drizzle":
//            self = .drizzle
//        case "Mist":
//            self = .mist
//        case "Smoke":
//            self = .smoke
//        case "Fog":
//            self = .fog
//        case "Haze":
//            self = .haze
//        case "Dust":
//            self = .dust
//        case "Sand":
//            self = .sand
//        case "Ash":
//            self = .ash
//        case "Squall":
//            self = .squall
//        case "Tornado":
//            self = .tornado
//        default:
//            self = .clear
//        }
//    }
//    
//    enum CodingKeys: String, CodingKey {
//        case thunderstorm = "Thunderstorm"
//        case drizzle = "Drizzle"
//        case rain = "Rain"
//        case snow = "Snow"
//        case mist = "Mist"
//        case smoke = "Smoke"
//        case haze = "Haze"
//        case dust = "Dust"
//        case fog = "Fog"
//        case sand = "Sand"
//        case ash = "Ash"
//        case squall = "Squall"
//        case tornado = "Tornado"
//        case clear = "Clear"
//        case clouds = "Clouds"
//        
//    }
//    
//    case thunderstorm
//    case drizzle
//    case rain
//    case snow
//    case mist
//    case smoke
//    case haze
//    case dust
//    case fog
//    case sand
//    case ash
//    case squall
//    case tornado
//    case clear
//    case clouds
//
//}
//
//
//
//// MARK: - Daily
//struct Daily: Codable, Identifiable {
//    var id = UUID().uuidString
//    let dt, sunrise, sunset, moonrise: Int?
//    let moonset: Int?
//    let moonPhase: Double?
//    let temp: Temp?
//    let feelsLike: FeelsLike?
//    let pressure, humidity: Int?
//    let dewPoint, windSpeed: Double?
//    //    let windDeg: Int?
//    //    let windGust: Double?
//    let weather: [Weather]?
//    //    let clouds: Int?
//    let pop, uvi, snow: Double?
//    
//    enum CodingKeys: String, CodingKey {
//        case dt, sunrise, sunset, moonrise
//        case moonset
//        case moonPhase
//        case temp
//        case feelsLike
//        case pressure, humidity
//        case dewPoint, windSpeed
//        //        case windDeg
//        //        case windGust
//        case weather
//        //        case clouds
//        case pop, uvi, snow
//    }
//}
//
//// MARK: - FeelsLike
//struct FeelsLike: Codable {
//    let day, night, eve, morn: Double?
//}
//
//// MARK: - Temp
//struct Temp: Codable {
//    let day, min, max, night: Double?
//    let eve, morn: Double?
//}
//
