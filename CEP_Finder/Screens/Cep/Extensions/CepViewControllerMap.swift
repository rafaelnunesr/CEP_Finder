//
//  CepViewControllerMap.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/20/21.
//

import UIKit
import MapKit
import CoreLocation

extension CepViewController {
    
    // MARK: UpdateMaps
    @objc func updateMaps(_ notification: Notification) {
        
        let coordinates = notification.object as? Coordinate
        guard let _coodinates = coordinates else { return }
        
        DispatchQueue.main.async {
            let initialLocation = CLLocation(latitude: _coodinates.lat, longitude: _coodinates.lng)
            let coordinaRegion = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: self.regionRadius, longitudinalMeters: self.regionRadius)
            self.map.setRegion(coordinaRegion, animated: true)
        }
    }
    
    // MARK: CheckLocationServices
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            self.setupLocationManager()
            self.checkLocationAuthorization()
        }else {
            let error = ErrorHandler(title: "Getting location failed", code: nil, errorDescription: "It seems we're not allowed to get your location. Go to settings and alllow us if you want a better experience.")
            alertUser(error: error)
        }
    }

    // MARK: CheckLocationAuthorization
    func checkLocationAuthorization() {
        
        switch CLLocationManager.authorizationStatus() {
        
            case .authorizedWhenInUse:
                self.startTrackingUserLocation()
            case .denied:
                let error = ErrorHandler(title: "Getting location failed", code: nil, errorDescription: "It seems we're not allowed to get your location. Go to settings and alllow us if you want a better experience.")
                alertUser(error: error)
                break
            case .notDetermined:
                self.locationManager.requestWhenInUseAuthorization()
                break
            case .restricted:
                let error = ErrorHandler(title: "Getting location failed", code: nil, errorDescription: "It seems we're not allowed to get your location. Maybe your device is settled with parent control.")
                alertUser(error: error)
                break
            case .authorizedAlways:
                break
            @unknown default:
                break
        }
    }
    
    // MARK: StartTrackingUserLocation
    func startTrackingUserLocation() {
        self.map.showsUserLocation = true
        self.centerViewOnUserLocation()
        self.locationManager.startUpdatingLocation()
        self.previousLocation = getCenterLocation(for: map)
    }
    
    // MARK: SetupLocationManager
    func setupLocationManager() {
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    // MARK: CenterViewOnUserLocation
    func centerViewOnUserLocation() {
        if let location = self.locationManager.location?.coordinate{
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: self.regionRadius, longitudinalMeters: self.regionRadius)
            
            self.map.setRegion(region, animated: true)
        }
    }
    
    // MARK: GetCenterLocation
    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
}
