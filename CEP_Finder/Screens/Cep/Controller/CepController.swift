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
    
}
