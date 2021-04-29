//
//  CepNetwork.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/13/21.
//

import Foundation

enum PersonalizedErrorDescription: String {
    case network = "It looks like you're offline. Please check your connection."
    case invalidZipCode = "Ops. The zip code doesn't exist. Please inform a valid zip code"
    case noZipCode = "ZipCode value is nill"
    case noGoogleApiKey = "Hey user, a Google Key is required to update the map using Google Services. If you are a developer, put your Google Key in CepNetwork class. Otherwise, your current location or Pacific ocean will be displayed as map when History and Favorite adddress is tapped."
}

enum Models {
    case cepModel
    case geocoding
}


class CepNetwork {

    var zipCode: String?
    let googleApiKey = GoogleApiKey.key.rawValue
    
    // MARK: CheckNetworkStatus
    func checkNetworkStatus() -> Bool {
        if Reachability.isConnectedToNetwork(){
            return true
        }
        return false
    }
    
    private func getDataFromAPI(url: String, model: Models, completion: @escaping GenericTypes.completion<Any?>) {
        
        if !self.checkNetworkStatus() {
            completion(nil, self.networkError())
        }
        
        let session = URLSession.shared
        let url = URL(string: url)
        
        guard let _url = url else { return }
        
        let task = session.dataTask(with: _url) { (data, response, error) in
            
            guard let _data = data else { return }
            
            do {
                switch model {
                    case .cepModel:
                        let result = try JSONDecoder().decode(CepModel.self, from: _data)
                        completion(result, nil)
                case .geocoding:
                    let result = try JSONDecoder().decode(GeocodingApi.self, from: _data)
                    completion(result, nil)
                    default:
                        return
                }
            }catch {
                
                if error.localizedDescription == "The data couldn’t be read because it is missing." {
                    completion(nil, self.invalidZipCode())
                }else {
                    completion(nil, ErrorHandler(title: "Error getting data", code: nil, errorDescription: error.localizedDescription))
                }
            }
        }
        task.resume()
        
    }
    
    
    // MARK: GetAddress
    func getAddress(completion: @escaping GenericTypes.completion<CepModel?>) {
        let url = "https://viacep.com.br/ws/\(zipCode ?? "")/json/"
        
        self.getDataFromAPI(url: url, model: Models.cepModel) { (result, error) in
            guard let result = result else {
                completion(nil, error)
                return
            }
            completion(result as? CepModel, nil)
        }
    }
    
    // MARK: GetLatLngGoogleApi
    func getLatLngGoogleApi(completion: @escaping GenericTypes.completion<GeocodingApi?>) {
    
        guard let _zipCode = zipCode else {
            completion(nil, self.emptyZipCode())
            return
        }
        
        if self.googleApiKey.isEmpty {
            completion(nil, self.googleApiKeyMissing())
        }

        let googleURL = "https://maps.googleapis.com/maps/api/geocode/json?key=\(googleApiKey)&components=postal_code:\(_zipCode)"
        
        self.getDataFromAPI(url: googleURL, model: Models.geocoding) { (result, error) in
            guard let result = result else {
                completion(nil, error)
                return
            }
            completion(result as? GeocodingApi, nil)
        }
    }
    
    // MARK: NetworkError
    private func networkError() -> ErrorHandler {
        return ErrorHandler(title: "Network error", code: 404, errorDescription: PersonalizedErrorDescription.network.rawValue)
    }
    
    // MARK: GoogleApiKeyMissing
    private func googleApiKeyMissing() -> ErrorHandler {
        return ErrorHandler(title: "Google Api Key Missing", code: nil, errorDescription: PersonalizedErrorDescription.noGoogleApiKey.rawValue)
    }
    
    // MARK: InvalidZipCode
    private func invalidZipCode() -> ErrorHandler {
        return ErrorHandler(title: "Invalid Zip Code", code: nil, errorDescription: PersonalizedErrorDescription.invalidZipCode.rawValue)
    }
    
    // MARK: EmptyZipCode
    private func emptyZipCode() -> ErrorHandler {
        return ErrorHandler(title: "Zip Code is null", code: nil, errorDescription: PersonalizedErrorDescription.noZipCode.rawValue)
    }
    
}
