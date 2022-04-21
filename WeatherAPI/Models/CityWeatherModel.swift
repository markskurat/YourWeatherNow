//
//  WeatherModelUpdated.swift
//  WeatherAPI
//
//  Created by Mark Skurat on 3/29/22.
//

import Foundation
import CoreLocation

struct Welcome: Codable {
    let city: City?
}

// MARK: - City
struct City: Codable {
    let id: Int?
    let name: String?
}
