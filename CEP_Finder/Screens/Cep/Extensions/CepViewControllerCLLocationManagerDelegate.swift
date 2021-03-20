//
//  CepViewControllerCLLocationManagerDelegate.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/20/21.
//

import CoreLocation

extension CepViewController: CLLocationManagerDelegate {
    
    // MARK: LocationManagerDidChangeAuthorization
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.checkLocationAuthorization()
    }
}
