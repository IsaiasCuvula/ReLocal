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
    
    @Published var permissionDenied = false
    //@Published var mapView = MKMapView()
    @Published var mpType: MKMapType = .standard
    @Published var searchText = ""
    @Published var places: [Place] = []
    
    
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
        case .restricted, .denied:
            permissionDenied.toggle()
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate ,span: MapDetails.defaultSpan)
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    
    //MARK: - Test Func
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        self.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        //self.mapView.setRegion(self.region, animated: true)
        
        //self.mapView.setVisibleMapRect(self.mapView.visibleMapRect, animated: true)
        
    }
    
    
    func searchQuery(){
        
        places.removeAll()
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        
        MKLocalSearch(request: request).start { response, _ in
            guard let result = response else { return }
            
            self.places = result.mapItems.compactMap({ (item) -> Place? in
                return Place(place: item.placemark)
            })
        }
        
        
    }
}



