//
//  MapLocationManager.swift
//  Order Coffe
//
//  Created by Ivan Pushkov on 20.11.2024.
//

import Foundation
import MapKit


class LocationManager: NSObject{
    
    var locationManager = CLLocationManager()
    private var locationAppIsOn: Bool!
    
    override init(){
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    
   
    
    func checklocationPhoneIsOn() -> Bool{
        if CLLocationManager.locationServicesEnabled(){
            print("Службы геолокации включены.")
            return true
        }
        print("Службы геолокации выключены.")
      return  false
    }
    
    func checkLocationAppIsOn()-> Bool {
      let status = locationManager.authorizationStatus
        handleAuthorizationStatus(status)
        return locationAppIsOn
    }
    private func handleAuthorizationStatus(_ status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationAppIsOn = false
        case .restricted:
            locationAppIsOn = false
        case .denied:
            locationAppIsOn = false
        case .authorizedWhenInUse:
            locationAppIsOn = true
        case .authorizedAlways:
            locationAppIsOn = true
        @unknown default:
            locationAppIsOn = true
        }
    }
    
}

extension LocationManager: CLLocationManagerDelegate{
  
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            let status = manager.authorizationStatus
            switch status {
            case .notDetermined:
                print("Статус: не определён.")
            case .restricted, .denied:
                print("Доступ к геолокации ограничен или запрещён.")
            case .authorizedWhenInUse, .authorizedAlways:
                print("Доступ к геолокации разрешён.")
            @unknown default:
                print("Неизвестный статус.")
            }
        }
}

