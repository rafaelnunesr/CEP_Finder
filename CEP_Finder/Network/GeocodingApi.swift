//
//  GeocodingApi.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/19/21.
//

import Foundation

struct GeocodingApi: Codable {
    let results: [Geocoding]
    let status: String
}

struct Geocoding: Codable {
    let address_components: [GeocodingAddressComponent]
    let formatted_address: String
    let geometry: GeocodingGeometry
    let place_id: String
    let types: [String]
}

struct GeocodingAddressComponent: Codable {
    let long_name: String
    let short_name: String
    let types: [String]
}

struct GeocodingGeometry: Codable {
    let bounds: GeocodingBounds
    let location: LatLng
    let location_type: String
    let viewport: GeocodingBounds
}

struct GeocodingBounds: Codable {
    let northeast: LatLng
    let southwest: LatLng
}

struct LatLng: Codable {
    let lat: Double
    let lng: Double
}
