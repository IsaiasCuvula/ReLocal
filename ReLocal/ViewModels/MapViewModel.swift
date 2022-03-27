//
//  MapViewModel.swift
//  ReLocal
//
//  Created by Isaias Cuvula on 27.03.22.
//

import SwiftUI
import MapKit




//MARK: - Obter a locatizacao real do usuario


enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: -8.838333, longitude:  13.234444)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
}


final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
  
    var locationManager: CLLocationManager?
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    
    func checkIfLocationServiseIsEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager?.delegate = self
            //locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            print("Show alert")
        }
    }
    
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else {
            return
        }
        
        switch locationManager.authorizationStatus{
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your Location is restricted likely due to parental controls.")
        case .denied:
            print("Your Location have denied this app location. Go into settings to change it.")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate ,span: MapDetails.defaultSpan)
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}



