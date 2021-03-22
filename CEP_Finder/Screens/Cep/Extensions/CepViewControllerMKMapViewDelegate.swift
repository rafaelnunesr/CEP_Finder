//
//  CepViewControllerMKMapViewDelegate.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/20/21.
//

import MapKit

extension CepViewController: MKMapViewDelegate {
    
    // MARK: MapView
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {

        let center = getCenterLocation(for: mapView)
        guard let previousLocation = self.previousLocation else { return }
        
        guard center.distance(from: previousLocation) > 50 else { return }
        self.previousLocation = center
    }
    
    
}
