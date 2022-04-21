//
//  LocationManager.swift
//  WeatherAPI
//
//  Created by Mark Skurat on 3/22/22.
//

import Foundation
import CoreLocation
import UIKit
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
}



class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var label: UILabel!
    
    let manager = CLLocationManager()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
            map.setRegion(region, animated: true)
        print(location.altitude)
        print(location.speed)
        
        self.map.showsUserLocation = true
        
        CLGeocoder().reverseGeocodeLocation(location) { placemark, error in
            if error != nil {
                print("There was an error")
            } else {
                if let place = placemark?[0] {
                    if place.subThoroughfare != nil {
                    self.label.text = "\(place.subThoroughfare!) \n \(place.thoroughfare!) \n \(place.country!)"
                    }
                  
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

