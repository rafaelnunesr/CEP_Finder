//
//  MapView.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/17/21.
//

import UIKit
import MapKit

struct Coordinate {
    let lat: Double
    let lng: Double
}

class MapView: UIView {
    
    let regionRadius: CLLocationDistance = 1000
    let map: MKMapView = MKMapView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup()
    private func setup() {
        self.buildViewHierarchy()
        self.setupComponents()
    }
    
    // MARK: SetupSubviews
    private func buildViewHierarchy() {
        self.addSubview(self.map)
    }
    
    private func setupComponents() {
        self.setupMap()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateMap), name: NSNotification.Name("updateMap"), object: nil)
    }
    
    @objc func updateMap(_ notification: Notification) {
    
        let coordinates = notification.object as? Coordinate
        
        guard let _coodinates = coordinates else { return }
        
        DispatchQueue.main.async {
            let initialLocation = CLLocation(latitude: _coodinates.lat, longitude: _coodinates.lng)
            let coordinaRegion = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: self.regionRadius, longitudinalMeters: self.regionRadius)
            self.map.setRegion(coordinaRegion, animated: true)
        }
    }
    
    private func setupMap() {
        self.setupMapConstraints()
        
        let initialLocation = CLLocation(latitude: -23.565163997932217, longitude: -46.652365089520536)
        let coordinaRegion = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: self.regionRadius, longitudinalMeters: self.regionRadius)
        self.map.setRegion(coordinaRegion, animated: true)
    }
    
    private func setupMapConstraints() {
        map.translatesAutoresizingMaskIntoConstraints = false
        map.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        map.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        map.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        map.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
}
