//
//  CityNameViewModel.swift
//  WeatherAPI
//
//  Created by Mark Skurat on 4/19/22.
//

import Foundation
import CoreLocation

class CityNameViewModel: ObservableObject {
    
    @Published var city: City?
    
    init() {
        grabPosts()
    }
    
    //39.95&lon=-74.19
    
    func grabPosts() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=39.95&lon=-74.19&exclude=minutely&appid=436470e0796ffc8b601c45b94d7922a1&units=imperial") else { return }
        
        
        downlaodData(forURL: url) { returnedData in
            if let data = returnedData {
                guard let response = try? JSONDecoder().decode(Welcome.self, from: data) else {
                    print("Error: Failed to decode")
                    return
                }
                DispatchQueue.main.async { [weak self] in
                    self?.city = response.city
                }
            } else {
                print("No data returned")
            }
        }
    }
    
    
    func downlaodData(forURL url: URL, completionHandler: @escaping (_ data: Data?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300
            else {
                print("Error downloading")
                completionHandler(nil)
                return
            }
            completionHandler(data)
            
        }
        .resume()
        
    }
}

