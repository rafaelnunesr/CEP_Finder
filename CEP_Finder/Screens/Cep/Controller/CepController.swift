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
    
    func getAddressByZipCode(with zipCode: String, completionHandler: @escaping (_ result: Bool, _ error: ErrorHandler?) -> Void) {
        
        let numericZipCode = zipCode.filter { $0 != "-" }
        
        if self.checkIfAddressIsFavorited() {
            completionHandler(true, nil)
        }
        
        self.cepNetwork.zipCode = numericZipCode

        self.cepNetwork.getAddress { (result, error) in
            
            DispatchQueue.main.async {
                guard let _result = result else {
                    completionHandler(false, error)
                    return
                }
            
                let cityState = _result.localidade + " / " + _result.uf
                self.address = AddressCoreData(zipCode: _result.cep, streeName: _result.logradouro, cityState: cityState)
                self.addNewAddressToHistory()
                self.updateMap()
                completionHandler(true, nil)
            }
        }
    }
    
    func updateMap() {
        self.cepNetwork.getLatLngGoogleApi { (response, error) in
            print(response)
        }
    }
}
