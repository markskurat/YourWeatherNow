//
//  Double.swift
//  WeatherAPI
//
//  Created by Mark Skurat on 3/22/22.
//

import Foundation
import CoreLocation

extension Double {
    
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
    
    func round2Decimals() -> String {
        return String(format: "%.2f", self)
    }
    
}





