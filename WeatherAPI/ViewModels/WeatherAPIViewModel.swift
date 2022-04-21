//
//  WeatherAPIViewModel.swift
//  WeatherAPI
//
//  Created by Mark Skurat on 3/22/22.
//

import Foundation

//API KEY1 : 38d757bd8c36f303ed4f24fe85a1d762
//API KEY2 : 436470e0796ffc8b601c45b94d7922a1

class WeatherAPIViewModel: ObservableObject {

    @Published var days: [Daily] = []
    @Published var hours: [CurrentConditions] = []
    @Published var current: CurrentConditions?
    
    init() {
        getPosts()
    }

    func getPosts() {

        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=39.953729&lon=-74.197919&exclude=minutely&appid=38d757bd8c36f303ed4f24fe85a1d762&units=imperial") else { return }
        
//        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=39.953729&lon=-74.197919&exclude=minutely&appid=436470e0796ffc8b601c45b94d7922a1&units=imperial") else { return }
        
//        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=39.95&lon=-74.19&exclude=minutely&appid=436470e0796ffc8b601c45b94d7922a1&units=imperial") else { return }

        downlaodData(forURL: url) { returnedData in
            if let data = returnedData {
                guard let response = try? JSONDecoder().decode(ResponseBody.self, from: data) else {
                    print("Error: Failed to decode")
                    return
                }
                DispatchQueue.main.async { [weak self] in
                    self?.days = response.daily ?? []
                    self?.hours = response.hourly ?? []
                    self?.current = response.current
                    
                    
//                    print("------------------")
//
//                    for hour in (response.hourly ?? []){
//                        for weather in (hour.weather ?? []){
//                            print(weather.icon)
//                        }
//                    }
//
//                    print("------------------")
                    
//                    self?.city = response.city
//                    self?.list = response.list ?? []
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
