//
//  CepController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/16/21.
//

import Foundation

class CepController {
    
    private var coreData = CoreDataManager(addressData: nil)
    var arrayHistory: [CoreHistory?] = []
    var address: AddressCoreData? = nil
    
    var cepNetwork: CepNetwork = CepNetwork()
    
    func addNewAddressToHistory() {
        guard let _address = self.address else { return }
        self.coreData.addressData = _address
        self.coreData.persistCoreDataHistory()
    }
    
    func addFavoriteAddress() {
        self.coreData.addressData = address
        self.coreData.persistCoreDataFavorites()
    }
    
    func removeFavoriteAddress() {
        self.coreData.deleteOneAddressFromFavorites(zipCode: self.address?.zipCode ?? "")
    }
    
    func checkIfAddressIsFavorited() -> Bool {
        guard let zipCode = self.address?.zipCode else { return false }
        
        if self.coreData.getAddressByZipCodeCoreFavorites(zipCode: zipCode) != nil {
            return true
        }
        
        return false
    }
    
    func getFavoriteAddress() -> CoreFavorites? {
        guard let zipCode = self.address?.zipCode else { return nil }
        return self.coreData.getAddressByZipCodeCoreFavorites(zipCode: zipCode)
    }
    
    func getCoordinates(with zipCode: String, completionHandler: @escaping (_ result: Coordinate?, _ error: ErrorHandler?) -> Void) {
        
        self.cepNetwork.getLatLngGoogleApi { (response, error) in
            
            if response != nil {
                let lat = response?.results.first?.geometry.location.lat
                let lng = response?.results.first?.geometry.location.lng
                guard let _lat = lat, let _lng = lng else { return }
                completionHandler(Coordinate(lat: _lat, lng: _lng), nil)
            }
            
            completionHandler(nil, error)
        }
        
    }
    
    func getAddressByZipCode(with zipCode: String, completionHandler: @escaping (_ result: Bool, _ error: ErrorHandler?) -> Void) {
        
        let numericZipCode = zipCode.filter { $0 != "-" }
        
        if self.checkIfAddressIsFavorited() {
            completionHandler(true, nil)
        }
        
        self.cepNetwork.zipCode = numericZipCode
        let lat: Double = -23.565163997932217 // Av. Paulista, SP
        let lng: Double = -46.652365089520536 // Av. Paulista, SP
        
        self.cepNetwork.getAddress { (result, error) in
            DispatchQueue.main.async {
                guard let _result = result else {
                    completionHandler(false, error)
                    return
                }
                
                let cityState = _result.localidade + " / " + _result.uf
                self.address = AddressCoreData(zipCode: _result.cep, streeName: _result.logradouro, cityState: cityState, latitude: lat, longitude: lng)
                self.addNewAddressToHistory()
                completionHandler(true, nil)
            }
        }
    
    }
    
    func updateMap(zipCode: String, completionHandler: @escaping (_ result: Bool?, _ error: ErrorHandler?) -> Void) {
        
        self.getCoordinates(with: zipCode) { (result, error) in
            if result != nil {
               
                guard let _result = result else {
                    completionHandler(false, error)
                    return
                }
                
                let oldAddress = self.address
                
                self.address = AddressCoreData(zipCode: oldAddress?.zipCode ?? "", streeName: oldAddress?.streeName ?? "", cityState: oldAddress?.cityState ?? "", latitude: _result.lat, longitude: _result.lng)
                
                let latLng = Coordinate(lat: _result.lat, lng: _result.lng)
                
                NotificationCenter.default.post(name: Notification.Name("updateMap"), object: latLng)
                completionHandler(true, error)
            }
            completionHandler(false, error)
        }
        
    }
    
}
