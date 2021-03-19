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
    let geometry: [GeocodingGeometry]
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

/*
{
  "results": [
    {
      "address_components": [
        {
          "long_name": "07143-510",
          "short_name": "07143-510",
          "types": [
            "postal_code"
          ]
        },
        {
          "long_name": "Taboão",
          "short_name": "Taboão",
          "types": [
            "political",
            "sublocality",
            "sublocality_level_1"
          ]
        },
        {
          "long_name": "Guarulhos",
          "short_name": "Guarulhos",
          "types": [
            "administrative_area_level_2",
            "political"
          ]
        },
        {
          "long_name": "São Paulo",
          "short_name": "SP",
          "types": [
            "administrative_area_level_1",
            "political"
          ]
        },
        {
          "long_name": "Brazil",
          "short_name": "BR",
          "types": [
            "country",
            "political"
          ]
        }
      ],
      "formatted_address": "Taboão, Guarulhos - State of São Paulo, 07143-510, Brazil",
      "geometry": {
        "bounds": {
          "northeast": {
            "lat": -23.4142874,
            "lng": -46.5022536
          },
          "southwest": {
            "lat": -23.4201164,
            "lng": -46.5053945
          }
        },
        "location": {
          "lat": -23.4179959,
          "lng": -46.5033273
        },
        "location_type": "APPROXIMATE",
        "viewport": {
          "northeast": {
            "lat": -23.4142874,
            "lng": -46.5022536
          },
          "southwest": {
            "lat": -23.4201164,
            "lng": -46.5053945
          }
        }
      },
      "place_id": "ChIJU3-BDDuLzpQR_YP0nCnj1Fc",
      "types": [
        "postal_code"
      ]
    }
  ],
  "status": "OK"
}
*/
